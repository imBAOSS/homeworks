# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  username   :string           not null
#

class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many :contacts, class_name: :Contact, primary_key: :id, foreign_key: :user_id
  has_many :share_contacts, through: :contacts, source: :shared_contacts
  has_many :shared_contact, class_name: :ContactShare, primary_key: :id, foreign_key: :user_id
end
