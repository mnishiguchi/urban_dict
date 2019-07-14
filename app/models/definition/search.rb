# frozen_string_literal: true

class Definition
  class Search < ApplicationService
    attr_reader :q, :tag, :user

    None = Definition.none

    def initialize(opts = {})
      @q = opts[:q]
      @tag = opts[:tag]
      @user = opts[:user]
    end

    def call
      return None if q.blank? && tag.blank?

      search
    end

    def search
      @search = begin
        result = Definition.all
        result = result.with_tag_name(tag) if tag.present?
        result = result.fuzzy_match_by_word(q) if q.present?
        result.order(score: :desc)
      end
    end

    def user_upvotes
      user ? search.where(id: user.upvotes) : None
    end

    def user_downvotes
      user ? search.where(id: user.downvotes) : None
    end

    def user_definitions
      user ? search.where(id: user.definition_ids) : None
    end
  end
end
