# frozen_string_literal: true

class DefinitionsController < ApplicationController
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
    redirect_to words_url(q: @definition.word)
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
    redirect_to words_url(q: @definition.word)
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
