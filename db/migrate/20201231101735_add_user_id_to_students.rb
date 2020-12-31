class AddUserIdToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :user_id, :int
  end
end
