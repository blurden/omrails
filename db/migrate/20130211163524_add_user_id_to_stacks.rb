class AddUserIdToStacks < ActiveRecord::Migration
  def change
    add_column :stacks, :user_id, :integer
    add_index :stacks, :user_id
  end
end
