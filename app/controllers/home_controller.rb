class HomeController < ApplicationController
  def index
    @photos     = Photo.where(visible: true)
    @sliders    = Slider.where(visible: true)
    @about      = About.first
    @skills     = Skill.all
    @portfolios = Portfolio.where(visible: true).order(:id).includes(:portfolio_details)
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
end
