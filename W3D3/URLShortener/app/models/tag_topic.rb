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
    links = Tagging.all.where(tag_id: self.id).map do |element|
      ShortenedUrl.find(element.id)
    end

    links.sort_by { |link| link.num_clicks }.reverse.take(5).map(&:longurl)
  end
end
