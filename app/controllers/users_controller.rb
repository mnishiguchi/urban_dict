# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @definitions = Definition.where(id: current_user.upvotes).page(params[:page]).per(20)
  end
end
