class OrderPolicy < ApplicationPolicy
  def index?
    user.present? 
  end

  def show?
    user.present? && (user.admin? || record.user == user)
  end

  def create?
    user.present?
  end

  def new?
    create?
  end
end


