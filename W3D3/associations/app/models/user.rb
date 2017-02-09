# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base

  has_many :enrollments,
    class_name: :Enrollment,
    primary_key: :id,
    foreign_key: :student_id

  has_many :courses_instructed,
    class_name: :Course,
    primary_key: :id,
    foreign_key: :instructor_id

  has_many :enrolled_courses,
    through: :enrollments,
    source: :course

end
