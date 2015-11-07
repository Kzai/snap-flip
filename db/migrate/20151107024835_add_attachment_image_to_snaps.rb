class AddAttachmentImageToSnaps < ActiveRecord::Migration
  def self.up
    change_table :snaps do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :snaps, :image
  end
end
