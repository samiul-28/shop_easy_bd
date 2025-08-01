class ReviewPolicy < ApplicationPolicy
    def create?
      user.present?
    end
  
    def edit?
      update?
    end
  
    def update?
      user.present? && (record.user == user || user.admin?)
    end
  
    def destroy?
      user.present? && (record.user == user || user.admin?)
    end
end
  