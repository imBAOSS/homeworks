# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ActiveRecord::Base
  COLORS = %w(brown gray black white yellow orange)
  validates :birth_date, :color, :name, :sex, presence: true
  validates :sex, inclusion: { in: ['M', 'F'] }
  validates :color, inclusion: { in: COLORS }

  has_many :cat_rental_requests, dependent: :destroy

  def age
    today = Time.now.to_date
    diff = today - birth_date
    diff.to_i / 365
  end
end
