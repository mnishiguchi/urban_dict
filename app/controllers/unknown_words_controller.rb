# frozen_string_literal: true

class UnknownWordsController < ApplicationController
  def index
    @unknown_words = UnknownWord.where.not(word: Definition.words)
  end

  def new
    @unknown_word = UnknownWord.new
  end

  def create
    @unknown_word = UnknownWord.new(unknown_word_params)
    if @unknown_word.save
      flash[:notice] = "An unknown work was successfully created"
      redirect_to unknown_words_url
    else
      render :new
    end
  end

  private

  def unknown_word_params
    params.require(:unknown_word).permit(:word, :memo)
  end
end
