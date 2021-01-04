class College < ApplicationRecord
  belongs_to :student
  validates :name, presence: true, length: { minimum: 3, maximum: 75 }
  validates_uniqueness_of :name
end