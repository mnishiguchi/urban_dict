# frozen_string_literal: true

class TagsController < ApplicationController
  def index
    @tag_names = Tag.all.pluck(:name)
  end
end
