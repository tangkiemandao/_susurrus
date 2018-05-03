class AddAttachmentImageToSliders < ActiveRecord::Migration[5.1]
  def self.up
    change_table :sliders do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :sliders, :image
  end
end
