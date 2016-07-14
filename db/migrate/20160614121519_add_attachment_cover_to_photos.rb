class AddAttachmentCoverToPhotos < ActiveRecord::Migration
  def self.up
    change_table :photos do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :photos, :cover
  end
end
