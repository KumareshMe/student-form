class Course < ApplicationRecord
  has_many :student_courses
  has_many :students, through: :student_courses
    validates :name, presence: true, length: { minimum: 3, maximum: 75 }
    validates_uniqueness_of :name
end