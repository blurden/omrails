class CreateStacks < ActiveRecord::Migration
  def change
    create_table :stacks do |t|
      t.string :description

      t.timestamps
    end
  end
end
