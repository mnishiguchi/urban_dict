# frozen_string_literal: true

class DefinitionPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def show?
    user.present?
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    user == record.author
  end

  def edit?
    update?
  end

  def destroy?
    user.admin?
  end

  def vote?
    user.present?
  end
end
