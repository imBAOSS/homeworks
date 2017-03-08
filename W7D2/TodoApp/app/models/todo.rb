# == Schema Information
#
# Table name: todos
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  body       :string           not null
#  done       :boolean          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Todo < ActiveRecord::Base
  validates :title, :body, presence: true
  validates :done, inclusion: { in: [true, false] }

  has_many :taggings,
    class_name: :Tagging,
    foreign_key: :todo_id

  has_many :tags,
    through: :taggings,
    source: :tag

end
