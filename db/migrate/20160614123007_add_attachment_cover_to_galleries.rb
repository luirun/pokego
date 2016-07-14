class AddAttachmentCoverToGalleries < ActiveRecord::Migration
  def self.up
    change_table :galleries do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :galleries, :cover
  end
end
