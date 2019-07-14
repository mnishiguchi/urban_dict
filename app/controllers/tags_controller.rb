# frozen_string_literal: true

class TagsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
    @definitions = Definition::Search.call(tag: @tag.name).page(params[:page]).per(20)
  end
end
