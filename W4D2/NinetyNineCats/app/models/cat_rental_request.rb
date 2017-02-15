# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ActiveRecord::Base
  STATUSES = %w(PENDING APPROVED DENIED)
  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, inclusion: {in: STATUSES}

  validate :does_not_overlap_approved_request

  belongs_to :cat

  def overlapping_requests
    CatRentalRequest
        .where.not(id: self.id)
        .where(cat_id: cat_id)
        .where(<<-SQL, start_date: start_date, end_date: end_date)
           NOT( (start_date > :end_date) OR (end_date < :start_date) )
        SQL
  end

  def overlapping_approved_requests
    overlapping_requests.where("status = 'APPROVED'")
  end

  def does_not_overlap_approved_request
  # A denied request doesn't need to be checked. A pending request
  # should be checked; users shouldn't be able to make requests for
  # periods during which a cat has already been spoken for.
    return if self.denied?

    unless overlapping_approved_requests.empty?
      errors[:base] <<
        "Request conflicts with existing approved request"
    end
  end
end

#   def date_to_i(date)
#     date.jd
#   end
#
#   def overlapping_requests
#     cat.cat_rental_requests.where.not(id: id)
#     .where("(? <= end_date) OR (? >= start_date)", date_to_i(start_date), date_to_i(end_date))
#       # .where(start_date <= :end_date).or(end_date >= :start_date)
#       # "(#{start_date} BETWEEN start_date AND end_date) OR (#{end_date} BETWEEN start_date AND end_date)")
#       # (<<-SQL, cat_id, start_date, end_date)
#       # SELECT
#       #   *
#       # FROM
#       #   cat_rental_requests
#       # JOIN
#       #   cats ON cat_rental_requests.cat_id = cats.id
#       # WHERE
#       #   cat.id != ?
#       #   AND ? BETWEEN (start_date, end_date)
#       #   OR ? BETWEEN (start_date, end_date)
#       # SQL
#   end
#
#   def overlapping_approved_requests
#     overlapping_requests.where(status: "APPROVED")
#
#   end
# end
