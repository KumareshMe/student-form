class AddCollegeIdToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :college_id, :int
  end
end
