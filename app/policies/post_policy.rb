class PostPolicy < ApplicationPolicy

  def create?
    return true
  end

  def update?
    record.user == user
  end

  def show?
    return true
  end

  def referrers?
    user.attractions.include? record.attraction
  end

  def post_stats?
    user.attractions.include? record.attraction
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
