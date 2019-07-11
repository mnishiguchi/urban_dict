# frozen_string_literal: true

class WordsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  # GET    /words
  # GET    /words?q=%23business
  # GET    /words?q=WIP
  # GET    /words?q=WIP&user_upvotes=true
  # GET    /words?q=WIP&user_downvotes=true
  # GET    /words?q=WIP&user_definitions=true
  def index
    @q = params[:q]
    rows = Definition::Search.call(q: params[:q], tag: params[:tag])

    # https://github.com/kaminari/kaminari/wiki/Kaminari-recipes#-how-do-i-paginate-an-array
    @definitions = Kaminari.paginate_array(rows).page(params[:page]).per(20)
  end
end
