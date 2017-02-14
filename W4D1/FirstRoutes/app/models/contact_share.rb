# == Schema Information
#
# Table name: contact_shares
#
#  id         :integer          not null, primary key
#  contact_id :integer          not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class ContactShare < ActiveRecord::Base
  validates :user_id, :contact_id, presence: true
  validates :user_id, uniqueness: {scope: :contact_id}

  belongs_to :contacts, class_name: :Contact, primary_key: :id, foreign_key: :contact_id
  belongs_to :users, class_name: :User, primary_key: :id, foreign_key: :user_id
end
