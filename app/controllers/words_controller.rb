# frozen_string_literal: true

class WordsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  # Top definitions for each word.
  # GET    /words
  def index
    @q = params[:q]
    rows = Definition.top_definitions(params[:q])
    # https://github.com/kaminari/kaminari/wiki/Kaminari-recipes#-how-do-i-paginate-an-array
    @definitions = Kaminari.paginate_array(rows).page(params[:page]).per(20)
  end
end
