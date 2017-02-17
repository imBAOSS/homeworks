module Toyable
  extend ActiveSupport::Concern

  included do
    belongs_to :toyable, polymorphic: true
    has_many :toys, as: :toyable
  end

  def receive_toy(name)
    toy = Toy.find_or_create_by(name: name)
    toy.toyable_id = self.id
    toy.toyable_type = self.class.to_s
    toy.save
  end
end
