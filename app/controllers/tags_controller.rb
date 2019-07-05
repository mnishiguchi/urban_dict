# frozen_string_literal: true

class TagsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
    rows = Definition.with_tag_name(@tag.name)
    rows = rows.sort_by { |x| [x.updated_at, x.score] } .reverse!

    # https://github.com/kaminari/kaminari/wiki/Kaminari-recipes#-how-do-i-paginate-an-array
    @definitions = Kaminari.paginate_array(rows).page(params[:page]).per(20)
  end
end
