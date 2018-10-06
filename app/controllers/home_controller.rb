class HomeController < ApplicationController
  def index
    @photos     = Photo.where(visible: true)
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
    photos = %w[http://thuthuatphanmem.vn/uploads/2018/04/09/tong-hop-50-hinh-nen-dep-nhat-cho-may-tinh_042207454.jpg
                 http://thuthuatphanmem.vn/uploads/2018/04/10/hinh-nen-anh-nang-binh-minh_052333541.jpg
                 http://thuthuatphanmem.vn/uploads/2018/04/10/hinh-nen-bong-hoa-dep-day-suc-song_052333603.jpg
                 http://thuthuatphanmem.vn/uploads/2018/04/10/hinh-nen-bong-hong-dep_052333650.jpg
                 http://thuthuatphanmem.vn/uploads/2018/04/10/hinh-nen-canh-hoa-dep_052333993.jpg
                 http://file.vforum.vn/hinh/2018/03/hinh-nen-dien-thoai-dep-nhat-full-hd-cho-dien-thoai-iphone-android-19.jpg
                 http://thuthuatphanmem.vn/uploads/2018/04/10/hinh-nen-cay-cau-thien-nhien-dep_052334071.jpg
                  ]
    @photos = [photos, photos].flatten
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
