class HomeController < ApplicationController
  def index
    @sliders    = Slider.where(visible: true)
    @about      = About.first
    @skills     = Skill.all
    @portfolios = Portfolio.where(visible: true).order(:id).includes(:portfolio_details)
    set_session
  end

  def send_mail
    mail  = { email: params[:Email], name:  params[:Name], content: params[:Message] }
    @name = mail[:name]
    MessageMailer.send_message(mail).deliver
    respond_to do |format|
      format.js
      format.html
    end
  end
  
  def photo
    @sliders = Slider.where(visible: true)
    @photos  = Photo.page params[:page]
  end

  private
  def set_session
    @portfolios ||= []
    session[:portfolio] = {}

    @portfolios.each do |portfolio|
      session[:portfolio][portfolio.id] = {
        id:              portfolio.id,
        architect:       portfolio.architect,
        location:        portfolio.location,
        lead_architects: portfolio.lead_architects,
        area:            portfolio.area,
        name:            portfolio.name,
        photographs:     portfolio.photographs,
        url:             portfolio.photo.url
      }
    end
  end
end
