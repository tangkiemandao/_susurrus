namespace :Instagram do
  desc "Import data to Photo from instagram"
  task :import_photo => :environment do
    SynchPhoto.new.import_to_db
    puts "done."
  end
end
