class HomeController < ApplicationController
  def index
    @photos     = Photo.where(visible: true)
    @sliders    = Slider.where(visible: true)
    @about      = About.first
    @skills     = Skill.all
    @portfolios = Portfolio.where(visible: true).order(:id).includes(:portfolio_details)
    set_session
    redirect_to photos_url
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
    photos = YAML.load_file(Rails.root.join('app/models/active_yaml/photos.yml'))
    @pages = photos.count / 10
    range = set_range
    if range[0] > photos.length
      @photos = []
    else
      @photos = photos[range[0]..range[1]].compact
    end
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
  
  def get_page
    params[:page].to_i <= 1 ? 0 : params[:page].to_i
  end
  
  def set_range
    limit = 20
    start_photo = limit * get_page
    end_photo   = limit * (get_page + 1)
    [start_photo, end_photo]
  end
end
