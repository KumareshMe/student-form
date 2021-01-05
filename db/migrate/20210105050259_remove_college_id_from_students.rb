class RemoveCollegeIdFromStudents < ActiveRecord::Migration[6.0]
  def change
    remove_column :students, :college_id, :integer
  end
end
