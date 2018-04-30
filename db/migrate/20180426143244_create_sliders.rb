class CreateSliders < ActiveRecord::Migration[5.1]
  def change
    create_table :sliders do |t|
      t.string :image, null: false
      t.string :caption, default: ''
      t.boolean :visible, default: true

      t.timestamps
    end
  end
end
