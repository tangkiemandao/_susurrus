class RemoveImageFromPortfolio < ActiveRecord::Migration[5.1]
  def change
    remove_column :portfolios, :image, :string
  end
end
