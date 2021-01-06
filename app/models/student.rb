class Student < ApplicationRecord
  belongs_to :user
    has_many :student_colleges
    has_many :colleges, through: :student_colleges
      has_many :student_courses
      has_many :courses, through: :student_courses
  validates :student_name, presence: true, length: { minimum: 3, maximum: 15 }
  validates :email_id, presence: true, length: { minimum: 10, maximum: 30 }
  validates :address, presence: true, length: { minimum: 10, maximum: 50 }
  validates :contact_number, presence: true, length: { minimum: 10, maximum: 10 }
  validates :marks, presence: true, length: { minimum: 2, maximum: 3 }
end