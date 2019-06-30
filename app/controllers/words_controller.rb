# frozen_string_literal: true

class WordsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  # Top definitions for each word.
  # GET    /words
  def index
    @definitions = Definition.find_by_sql(<<~SQL)
      SELECT DISTINCT ON (word)
          *
      FROM
          definitions
      ORDER BY
          word, score DESC ;
    SQL
  end
end
