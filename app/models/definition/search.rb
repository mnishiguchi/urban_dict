class Definition
  class Search < ApplicationService
    attr_reader :q, :tag, :user, :initial

    def initialize(opts = {})
      @q = opts[:q]
      @tag = opts[:tag]
      @user = opts[:user]
      @user = opts[:initial]
    end

    def call
      return [] if q.blank? && tag.blank?

      search
    end

    def search
      @search = begin
        result = Definition.all
        result = result.with_tag_name(tag) if tag.present?
        result = result.fuzzy_match_by_word(q) if q.present?
        result.sort_by(&:score).reverse!
      end
    end

    def user_upvotes
      user ? filter_by_ids(user.upvotes) : []
    end

    def user_downvotes
      user ? filter_by_ids(user.downvotes) : []
    end

    def user_definitions
      user ? filter_by_ids(user.definition_ids) : []
    end

    def filter_by_ids(ids)
      search.select { |x| ids.include?(x.id) }
    end
  end
end
