class AddUserToTasks < ActiveRecord::Migration[5.2]
  def up
    execute 'delete from tasks;'
    add_reference :tasks, :user, index: true
  end

  def down
    remove_reference :tasks, :user, index: true
  end
end
