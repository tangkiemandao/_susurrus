class CreatePortfolios < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolios do |t|
      t.string :name
      t.text :introduce
      t.string :image
      t.boolean :visible

      t.timestamps
    end
  end
end
