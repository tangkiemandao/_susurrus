class HomeController < ApplicationController
  def index
    @sliders    = Slider.where(visible: true)
    @about      = About.first
    @skills     = Skill.all
    @portfolios = Portfolio.where(visible: true).order(:id).includes(:portfolio_details)
    @photos     = Photo.limit(8).order("RAND()")

    set_session
  end

  def send_mail
    MessageMailer.send_message(get_mail_params).deliver if check_mail_validate.blank?
    @name = get_mail_params[:name]
    respond_to do |format|
      format.js
      format.html
    end
  end
  
  def photo
    @sliders = Slider.where(visible: true)
    @photos  = Photo.page params[:page]
  end

  def details
    @sliders = Slider.where(visible: true)
    @portfolio = Portfolio.find_by(id: params[:portfolio_id])
    @portfolio_details = @portfolio.try(:portfolio_details) || []
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
        url:             portfolio.photo.url(size: nil),
        pdf:             portfolio.pdf.url
      }
    end
  end

  def get_mail_params
    @mail ||= { email: params[:Email], name:  params[:Name], content: params[:Message] }
  end

  def check_mail_validate
    mail = get_mail_params
    @message_errors = ""
    @message_errors = "Please input valid your email" if mail[:email].blank? || mail[:email].match(URI::MailTo::EMAIL_REGEXP).nil?
    @message_errors = "Please input your name" if mail[:name].blank?
    @message_errors = "Please input your message" if mail[:content].blank?
    @message_errors
  end
end
