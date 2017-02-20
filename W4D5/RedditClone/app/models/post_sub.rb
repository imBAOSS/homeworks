# == Schema Information
#
# Table name: post_subs
#
#  id         :integer          not null, primary key
#  sub_id     :integer          not null
#  post_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# class PostSub < ActiveRecord::Base
#   validates :post_id, :sub_id, presence: true
#
#   belongs_to :post
#   belongs_to :sub
# end

class PostSub < ActiveRecord::Base
  validates :post, :sub, presence: true

  belongs_to :post
  belongs_to :sub
end
