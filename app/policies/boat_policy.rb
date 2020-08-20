class BoatPolicy < ApplicationPolicy

 class Scope < Scope
    def resolve
      scope.all
    end
  end

    # We don't need this because we have got 'except index' in the applciation controller
    def index?
      return true
    end

    def show?
      return true
    end

    # 'def new?' is in application_policy.rb
    def create?
      return true
    end

    # 'def edit?' is in application_policy.rb
    def update?
      record.user == user || user.admin
    end

    def destroy?
      record.user == user || user.admin
    end
end
