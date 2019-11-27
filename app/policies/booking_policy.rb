class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.find_by(user: record.user)
    end
  end

  def create?
    true
  end

  def pending?
    true
  end
end
