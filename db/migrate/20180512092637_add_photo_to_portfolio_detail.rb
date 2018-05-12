class AddPhotoToPortfolioDetail < ActiveRecord::Migration[5.1]
  def change
    add_attachment :portfolio_details, :photo
  end
end
