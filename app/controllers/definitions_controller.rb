# frozen_string_literal: true

class DefinitionsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  # All the definition for a given word.
  # GET    /definitions
  def index
    @word = params[:word]
    rows = Definition.where(word: params[:word]).sort_by(&:score).reverse!
    # https://github.com/kaminari/kaminari/wiki/Kaminari-recipes#-how-do-i-paginate-an-array
    @definitions = Kaminari.paginate_array(rows).page(params[:page]).per(20)

    respond_to do |format|
      format.html
      format.json { render json: @definitions }
    end
  end

  # GET    /definitions/new
  def new
    @definition = authorize Definition.new(word: params[:word])
  end

  # POST   /definitions
  def create
    @definition = authorize Definition.find_or_initialize_by(word: definition_params[:word])
    unless @definition.update(definition_params)
      flash.now[:alert] = "Validation error"
      render :new
      return
    end

    begin
      DefinitionTag.update_with_definition(@definition)
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
    @definition = authorize Definition.find(params[:id])
  end

  # PATCH  /definitions/:id
  def update
    @definition = authorize Definition.find(params[:id])
    unless @definition.update(definition_params)
      flash.now[:alert] = "Validation error"
      render :edit
      return
    end

    begin
      DefinitionTag.update_with_definition(@definition)
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
    params.require(:definition).permit(
      :word,
      :definition,
      :example,
      :tag_names,
      :user_id
    )
  end
end
