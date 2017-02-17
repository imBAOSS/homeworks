# == Schema Information
#
# Table name: cats
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cat < ActiveRecord::Base
  include Toyable
end
