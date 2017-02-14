# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  email      :string           not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Contact < ActiveRecord::Base
  validates :name, :email, :user_id, presence: true
  validates :email, uniqueness: {scope: :user_id}

  belongs_to :owner, class_name: :User, primary_key: :id, foreign_key: :user_id
  has_many :shared_users, through: :shared_contacts, source: :users
  has_many :shared_contacts, class_name: :ContactShare, primary_key: :id, foreign_key: :contact_id
end
