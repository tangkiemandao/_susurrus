class PortfolioDetail < ApplicationRecord
  belongs_to :portfolio
  validates_presence_of :introduce
  validates_presence_of :portfolio

  has_attached_file :photo
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
