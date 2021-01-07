class Student < ApplicationRecord
  belongs_to :user
    has_many :student_colleges
    has_many :colleges, through: :student_colleges
      has_many :student_courses
      has_many :courses, through: :student_courses
  validates :student_name, presence: true, length: { minimum: 3, maximum: 15 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email_id, presence: true, uniqueness: true, length: { maximum: 35}, format: { with: VALID_EMAIL_REGEX }
  validates :address, presence: true, length: { minimum: 10, maximum: 50 }
  validates :contact_number, presence: true, length: { minimum: 10, maximum: 10 }
  validates :marks, presence: true, :inclusion => 100..500
end