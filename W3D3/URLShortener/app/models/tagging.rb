# == Schema Information
#
# Table name: taggings
#
#  id         :integer          not null, primary key
#  url_id     :integer          not null
#  tag_id     :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Tagging < ActiveRecord::Base
  validates :url_id, :tag_id, presence: true

  belongs_to :topic,
    class_name: :TagTopic,
    primary_key: :id,
    foreign_key: :tag_id

  belongs_to :url,
    class_name: :ShortenedUrl,
    primary_key: :id,
    foreign_key: :url_id
end
