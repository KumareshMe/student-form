class CreateStudentCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :student_courses do |t|
      t.integer :student_id
      t.integer :college_id
    end
  end
end
