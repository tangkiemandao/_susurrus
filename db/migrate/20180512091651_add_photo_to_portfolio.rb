class AddPhotoToPortfolio < ActiveRecord::Migration[5.1]
  def change
    add_attachment :portfolios, :photo
  end
end
