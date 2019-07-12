class InitialsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @initial = params[:initial].upcase
    @words = Definition.words_grouped_by_alphabet[params[:initial].downcase]
  end
end
