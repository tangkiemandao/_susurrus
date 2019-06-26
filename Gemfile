source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
gem 'rails', '~> 5.1.4'
gem 'pg'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'activeadmin'
gem 'paperclip'
gem 'figaro'
gem 'settingslogic'
gem 'sendgrid-ruby'
gem 'devise'
gem 'instagram'
gem 'kaminari'
gem "mini_magick"
gem 'paperclip-imgur'
gem 'imgur-api'
gem 'imgurapi', git: 'git://github.com/trungle1612/imgur'
gem 'pry-byebug'
gem 'pry-rails'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'sqlite3'
end
group :development do
  gem 'faker', '~> 1.6', '>= 1.6.6'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem "better_errors"
  gem "binding_of_caller"
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
