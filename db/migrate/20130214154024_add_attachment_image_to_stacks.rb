class AddAttachmentImageToStacks < ActiveRecord::Migration
  def self.up
    change_table :stacks do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :stacks, :image
  end
end
