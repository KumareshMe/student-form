class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :student_courses, :college_id, :course_id
  end
end
