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
    # TODO: make a service object for various search logic
    rows =
      if @q.present?
        if @q.include?("#")
          tag_names = @q.gsub(/[^\w#]/, "").split("#").select(&:present?)
          Definition.with_tag_name(tag_names).sort_by(&:score).reverse!
        else
          # TODO: unique on word in ruby
          Definition.fuzzy_match_by_word(@q).sort_by(&:score).reverse!
        end
      else
        Definition.distinct_on_word.sort_by(&:updated_at).reverse!
      end

    if params[:user_upvotes]
      ids = current_user.upvotes
      rows = rows.select { |x| ids.include?(x.id) }
    end

    if params[:user_downvotes]
      ids = current_user.downvotes
      rows = rows.select { |x| ids.include?(x.id) }
    end

    if params[:user_definitions]
      ids = current_user.definitions.ids
      rows = rows.select { |x| ids.include?(x.id) }
    end

    # https://github.com/kaminari/kaminari/wiki/Kaminari-recipes#-how-do-i-paginate-an-array
    @definitions = Kaminari.paginate_array(rows).page(params[:page]).per(20)
  end
end
