# frozen_string_literal: true

class DefinitionsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  # All the definition for a given word.
  # GET    /definitions
  def index
    @word = params[:word]
    @definitions = Definition.fuzzy_match_by_word(params[:word]).order(score: :desc).page(params[:page]).per(2)

    respond_to do |format|
      format.html
      format.json { render json: @definitions }
    end
  end

  # GET    /definitions/new
  def new
    @definition = Definition.new
  end

  # POST   /definitions
  def create
    @definition = Definition.find_or_initialize_by(word: definition_params[:word])
    unless @definition.update(definition_params)
      flash.now[:alert] = "Validation error"
      render :new
      return
    end

    begin
      Definitions::UpdateDefinitionTags.call(tag_names: tag_names, definition: @definition)
    rescue StandardError => _e
      flash.now[:alert] = "Error saving tags"
      render :new
      return
    end

    flash[:notice] = "A word definition was successfully created"
    redirect_to definitions_path(word: @definition.word)
  end

  # GET    /definitions/:id/edit
  def edit
    @definition = Definition.find(params[:id])
  end

  # PATCH  /definitions/:id
  def update
    @definition = Definition.find(params[:id])
    unless @definition.update(definition_params)
      flash.now[:alert] = "Validation error"
      render :edit
      return
    end

    begin
      Definitions::UpdateDefinitionTags.call(tag_names: tag_names, definition: @definition)
    rescue StandardError => _e
      flash.now[:alert] = "Error saving tags"
      render :edit
      return
    end

    flash[:notice] = "A word definition was successfully updated"
    redirect_to definitions_path(word: @definition.word)
  end

  # DELETE /definitions/:id
  def destroy
    raise NotImplementedError
  end

  private

  def definition_params
    # Exclude tag_names because a definition object cannot handle it.
    params.require(:definition).except(:tag_names).permit(
      :word,
      :definition,
      :example,
      :user_id
    )
  end

  def tag_names
    params.permit!.dig(:definition, :tag_names).split(",")
  end
end
