class CreateAbouts < ActiveRecord::Migration[5.1]
  def change
    create_table :abouts do |t|
      t.text :content, null: false
      t.string :image_first, null: false
      t.string :image_second, null: false
      t.text :address
      t.string :phone
      t.string :email, null: false
      t.text :quote

      t.timestamps
    end
  end
end
