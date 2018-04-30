class AddNameToAbout < ActiveRecord::Migration[5.1]
  def change
    add_column :abouts, :name, :string
  end
end
