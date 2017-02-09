# == Schema Information
#
# Table name: visits
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  short_url_id :integer          not null
#  created_at   :datetime
#  updated_at   :datetime
#

class Visit < ActiveRecord::Base
  validates :user_id, :short_url_id, presence: true

  belongs_to :visitor,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

  belongs_to :short_urls,
    class_name: :ShortenedUrl,
    primary_key: :id,
    foreign_key: :short_url_id

  def self.record_visit!(user_id, short_url_id)
    Visit.create!(user_id: user_id, short_url_id: short_url_id)
  end
end
