module Paperclip
  class Cropper < Thumbnail
    def transformation_command
      if crop_command
        super.join(' ').sub(/ -crop \S+/, '').split(' ') << crop_command
      else
        super
      end
    end

    def crop_command
      target = @attachment.instance
      if target.cropping?
        target.processed = true
        " -crop '#{target.crop_w}x#{target.crop_h}+#{target.crop_x}+#{target.crop_y}'"
      end
    end
  end
end