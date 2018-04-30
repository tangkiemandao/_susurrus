class AddIntroduceToAbout < ActiveRecord::Migration[5.1]
  def change
    add_column :abouts, :introduce, :text
  end
end
