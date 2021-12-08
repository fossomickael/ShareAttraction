class AttractionPolicy < ApplicationPolicy


  def create?
    return true
  end

  def show?
    return true
  end

  def index?
    return true
  end

  def invite?
    user.ismember?(record)
  end

  def batch_invite?
    user.ismember?(record)
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
