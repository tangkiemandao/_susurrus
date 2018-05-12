class RemoveImageFromAbout < ActiveRecord::Migration[5.1]
  def change
    remove_column :abouts, :image_first, :string
    remove_column :abouts, :image_second, :string
  end
end
