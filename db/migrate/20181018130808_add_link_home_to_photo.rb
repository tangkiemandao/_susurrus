class AddLinkHomeToPhoto < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :link_home, :string
  end
end
