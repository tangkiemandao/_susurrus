class SynchPhoto
  def import_to_db
    ActiveRecord::Base.transaction do
      parse_data.each do |photo|
        p "Saving: #{photo.link}"
        photo.save
      end
    end
  end

  def parse_data
    photos = []
    InstagramApi.new.fetch_all_data.flatten.compact.each do |photo|
      photos << Photo.new(caption: photo[:caption],
                          link: photo[:link],
                          visible: true
                         )
    end

    photos
  end
end
