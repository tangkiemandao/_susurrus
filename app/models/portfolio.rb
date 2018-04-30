class Portfolio < ApplicationRecord
  has_many :portfolio_details, -> { where(visible: true) }, class_name: 'PortfolioDetail', dependent: :destroy
  validates_presence_of :name
  validates_presence_of :introduce
  validates_presence_of :image
end
