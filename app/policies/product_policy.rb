class ProductPolicy < ApplicationPolicy
  # Everyone can view index and show
  def index?
    true
  end

  def show?
    true
  end

  # Only admins can manage
  def create?
    user.present? && user.admin?
  end

  def new?
    create?
  end

  def update?
    user.present? && user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    user.present? && user.admin?
  end
end
