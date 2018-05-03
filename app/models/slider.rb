class Slider < ApplicationRecord
  has_attached_file :image, styles: { small: "100x100" }
  validates_attachment :image,
                         content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
