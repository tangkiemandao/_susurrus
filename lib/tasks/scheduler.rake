desc "This task is called by the Heroku scheduler add-on"
task :wake_up => :environment do
  puts "Updating feed..."
  `curl "susurrus.studio"`
  puts "done."
end
