class SynchPhoto
  def import_to_db
    ActiveRecord::Base.transaction do
      delete_all
      puts "Getting data"
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

  def delete_all
    puts "Delete all photo before import"
    Photo.delete_all
  end
end
