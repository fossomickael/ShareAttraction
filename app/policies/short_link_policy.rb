class ShortLinkPolicy < ApplicationPolicy
  def create?
    return true
  end

  def redirection?
    return true
  end

  def show?
    return true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
