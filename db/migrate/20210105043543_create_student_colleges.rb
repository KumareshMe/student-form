class CreateStudentColleges < ActiveRecord::Migration[6.0]
  def change
    create_table :student_colleges do |t|
      t.integer :student_id
      t.integer :college_id
    end
  end
end