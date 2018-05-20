class AddArchitetctsToPortfolios < ActiveRecord::Migration[5.1]
  def change
    add_column :portfolios, :architect, :string
    add_column :portfolios, :location, :string
    add_column :portfolios, :lead_architects, :string
    add_column :portfolios, :area, :string
    add_column :portfolios, :project_year, :int
    add_column :portfolios, :photographs, :string
  end
end
