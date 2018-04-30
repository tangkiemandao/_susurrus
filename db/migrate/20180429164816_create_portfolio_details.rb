class CreatePortfolioDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolio_details do |t|
      t.string :image
      t.text :introduce
      t.references :portfolio, foreign_key: true

      t.timestamps
    end
  end
end
