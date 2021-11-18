class UserPolicy < ApplicationPolicy
  def show?
    true
  end

  def one_user?
    user == record
  end

   def mentioned?
    user == record
  end

  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      scope.all
    end

  end
end
