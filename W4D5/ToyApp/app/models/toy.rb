# == Schema Information
#
# Table name: toys
#
#  id           :integer          not null, primary key
#  name         :string
#  toyable_id   :integer
#  toyable_type :string
#

class Toy < ActiveRecord::Base
  validates :name, uniqueness: { scope: :toyable }
  belongs_to :toyable, polymorphic: true
end
