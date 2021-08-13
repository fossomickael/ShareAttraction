class DashboardPolicy < ApplicationPolicy



  def dashboard?
    return true
  end

  

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
