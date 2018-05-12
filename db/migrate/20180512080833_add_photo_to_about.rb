class AddPhotoToAbout < ActiveRecord::Migration[5.1]
  def change
    add_attachment :abouts, :photo
  end
end
