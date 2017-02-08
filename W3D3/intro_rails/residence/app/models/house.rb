class House < ActiveRecord::Base
  validates :address, presence: true, uniqueness: true
  has_many :residents,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: "People"

end
