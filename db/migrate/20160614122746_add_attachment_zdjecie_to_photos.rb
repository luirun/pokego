class AddAttachmentZdjecieToPhotos < ActiveRecord::Migration
  def self.up
    change_table :photos do |t|
      t.attachment :zdjecie
    end
  end

  def self.down
    remove_attachment :photos, :zdjecie
  end
end
