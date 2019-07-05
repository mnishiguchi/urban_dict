# frozen_string_literal: true

class TagsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
    @definitions = Definition.with_tag(@tag).page(params[:page]).per(20)
  end
end
