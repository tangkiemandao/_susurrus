class RemoveImageFromPortfolioDetail < ActiveRecord::Migration[5.1]
  def change
    remove_column :portfolio_details, :image, :string
  end
end
