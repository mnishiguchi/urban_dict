# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user

  # TODO: Implement real login logic
  def current_user
    @current_user ||= User.first ||
                      User.create!(username: "mnishiguchi", email: "mnishiguchi@example.com")
  end
end
