class AddAttachmentPhotoToAnimals < ActiveRecord::Migration
  def self.up
    change_table :animals do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :animals, :photo
  end
end
