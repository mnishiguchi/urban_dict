# frozen_string_literal: true

class WordsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  # Top definitions for each word.
  # GET    /words
  def index
    rows = Definition.top_definitions
    # https://github.com/kaminari/kaminari/wiki/Kaminari-recipes#-how-do-i-paginate-an-array
    @definitions = Kaminari.paginate_array(rows).page(params[:page]).per(2)
  end
end
