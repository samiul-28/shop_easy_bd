class CategoryPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.present? && user.admin?
        scope.all               # Admin: see all categories
      else
        scope.all               # General user: also see all (but can’t manage)
      end
    end
  end

  def index?
    true  # Everyone can see category list
  end

  def show?
    true  # Everyone can click category to see products
  end

  def new?
    create?
  end

  def create?
    user.present? && user.admin?
  end

  def edit?
    update?
  end

  def update?
    user.present? && user.admin?
  end

  def destroy?
    user.present? && user.admin?
  end
end
