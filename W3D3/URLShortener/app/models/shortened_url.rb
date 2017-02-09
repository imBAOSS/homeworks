# == Schema Information
#
# Table name: shortened_urls
#
#  id         :integer          not null, primary key
#  longurl    :string           not null
#  shorturl   :string           not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

require 'securerandom'
require 'byebug'

class ShortenedUrl < ActiveRecord::Base
  validates :longurl, :shorturl, :user_id, presence: true
  validates :shorturl, uniqueness: true
  validate :no_spamming, :nonpremium_max

  belongs_to :submitter,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

  has_many :visits,
    class_name: :Visit,
    primary_key: :id,
    foreign_key: :short_url_id

  has_many :visitors,
    -> { distinct },
    through: :visits,
    source: :visitor

  has_many :tags,
    class_name: :Tagging,
    primary_key: :id,
    foreign_key: :url_id

  has_many :topics,
    through: :tags,
    source: :topic

  def self.random_code
    new_short_url = ShortenedUrl.first.shorturl
    while ShortenedUrl.exists?(:shorturl => new_short_url)
      new_short_url = SecureRandom.urlsafe_base64
    end
    new_short_url
  end

  def self.shorten_url(user, long_url)
    ShortenedUrl.create!(longurl: long_url, user_id: user.id,
      shorturl: ShortenedUrl.random_code)
  end

  def num_clicks
    Visit.all.select { |visit| visit.short_url_id == self.id }.count
  end

  def num_uniques
    self.visitors.count
  end

  def num_recent_uniques
    self.visits.where({created_at: 30.minutes.ago..Time.now}).count
  end

  def no_spamming
    user = User.find(user_id)
    urls_submitted = user.submitted_urls
    if urls_submitted.length <= 5
      return
    else
      time_submitted = urls_submitted[-5].created_at
      if time_submitted < 1.minute.ago
        self.errors[:spam] << ": No more than 5 urls per minute"
      end
    end
  end

  def nonpremium_max
    user = User.find(user_id)
    urls_submitted = user.submitted_urls
    if urls_submitted.length >= 5 && user.premium == false
      self.errors[:url_limit] << "reached for non-premium member. Give us money"
      print "Can't do it"
    end
  end
end
