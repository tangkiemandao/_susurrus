class AddVisibleToPortfolioDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :portfolio_details, :visible, :boolean, default: true
  end
end
