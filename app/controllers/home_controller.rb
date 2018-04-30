class HomeController < ApplicationController
  def index
    @photos     = Photo.where(visible: true)
    @sliders    = Slider.where(visible: true)
    @about      = About.first
    @skills     = Skill.all
    @portfolios = Portfolio.where(visible: true).order(:id).includes(:portfolio_details)
  end
end
