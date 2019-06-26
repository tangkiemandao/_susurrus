class Portfolio < ApplicationRecord
  has_many :portfolio_details, -> { where(visible: true) }, class_name: 'PortfolioDetail', dependent: :destroy
  validates_presence_of :name
  validates_presence_of :introduce

  has_attached_file :photo, storage: :imgur
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  has_attached_file :pdf
  validates_attachment_content_type :pdf, :content_type => ["application/pdf"]
end
