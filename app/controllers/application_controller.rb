# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery prepend: true

  before_action :authenticate_user!
end
