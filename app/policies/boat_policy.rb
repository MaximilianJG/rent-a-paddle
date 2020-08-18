class BoatPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

    def index?
      return true
    end

    def show?
      return true
    end

    def create?
      return true
    end

    def destroy?
      record.user == user || user.admin
    end

    def update?
      record.user == user || user.admin
    end

end
