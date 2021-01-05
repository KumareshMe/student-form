class StudentCollege < ApplicationRecord
    belongs_to :student
    belongs_to :college
end