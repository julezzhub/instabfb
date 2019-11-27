class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    # only when there was a booking before
    user.bookings.find_by(boyfriend: record.boyfriend).present?
  end

end
