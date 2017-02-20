# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  user_id    :integer          not null
#  sub_id     :integer          default("{}"), is an Array
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  validates :title, :author, :subs, presence: true

  has_many :post_subs, inverse_of: :post, dependent: :destroy
  has_many :subs, through: :post_subs, source: :sub

  belongs_to :author,
    class_name: :User,
    foreign_key: :user_id

  has_many :comments

  # has_many :postsubs,
  #   class_name: :PostSub
  #
  # has_many :subs,
  #   through: :postsubs,
  #   source: :sub


end
