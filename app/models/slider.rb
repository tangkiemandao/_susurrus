class Slider < ApplicationRecord
  has_attached_file :photo, storage: :imgur, :styles => { :medium => "3600x1800>" }, :processors => [:cropper], :default_url => "/no_image_available.svg"
  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  attr_accessor  :crop_x, :crop_y, :crop_w, :crop_h, :processed
  after_update :reprocess_slider, :if => :cropping?

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  private
  def reprocess_slider
    return if processed
    photo.reprocess!
  end
end
