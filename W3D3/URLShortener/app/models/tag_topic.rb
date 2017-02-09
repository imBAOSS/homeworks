# == Schema Information
#
# Table name: tag_topics
#
#  id         :integer          not null, primary key
#  topics     :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class TagTopic < ActiveRecord::Base
  validates :topics, presence: true

  has_many :tags,
    class_name: :TagTopic,
    primary_key: :id,
    foreign_key: :tag_id

  has_many :urls,
    through: :tags,
    source: :url

  def popular_links
    (<<-SQL
    SELECT

    FROM

    WHERE

    LIMIT
      5
    ORDER BY
      
    SQL
  end
end
