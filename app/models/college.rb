class College < ApplicationRecord
  has_many :student_colleges
  has_many :students, through: :student_colleges
    validates :name, presence: true, length: { minimum: 3, maximum: 25 }
    validates_uniqueness_of :name
end