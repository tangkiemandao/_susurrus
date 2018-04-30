class PortfolioDetail < ApplicationRecord
  belongs_to :portfolio
  validates_presence_of :image
  validates_presence_of :introduce
  validates_presence_of :portfolio
end
