class AddUserToTasks < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :creator, index: true
    add_foreign_key :tasks, :users, column: :creator_id
  end
end
