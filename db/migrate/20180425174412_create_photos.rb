class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.text :link, null: false
      t.text :caption, null: false
      t.boolean :visible, default: true

      t.timestamps
    end
  end
end
