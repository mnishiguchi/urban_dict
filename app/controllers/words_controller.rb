# frozen_string_literal: true

class WordsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  # TODO: Tag lists for filtering
  # GET    /words?q=WIP
  def index
    @q = params[:q]
    rows = Definition::Search.call(q: params[:q], tag: params[:tag])

    # https://github.com/kaminari/kaminari/wiki/Kaminari-recipes#-how-do-i-paginate-an-array
    @definitions = Kaminari.paginate_array(rows).page(params[:page]).per(20)
  end
end
