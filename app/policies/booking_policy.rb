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

  def accept?
    record.boyfriend.user == user #record in this instance is booking
  end

  def reject?
    record.boyfriend.user == user
  end
end
