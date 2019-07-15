# frozen_string_literal: true

class WordsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  # GET    /words?q=WIP&tag=tech
  def index
    @q = params[:q]
    @tag = params[:tag]

    rows = Definition::Search.call(q: params[:q], tag: params[:tag])
    @definitions = Kaminari.paginate_array(rows).page(params[:page]).per(10)
  end
end
