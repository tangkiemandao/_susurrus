# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create some photos
#  Photo.delete_all if Photo.count > 0
#  6.times do |i|
#    photo = Photo.new
#    photo.link = "special-#{i+1}.jpg"
#    photo.caption = Faker::Lorem.sentence
#    photo.save
#  end

# slider(header)
# Slider.delete_all if Slider.count > 0
# 5.times do |i|
#   slider = Slider.new
#   slider.image = "slide-#{i+1}.jpg"
#   slider.caption = Faker::Lorem.sentence
#   slider.visible = true
#   slider.save
# end

# About me
# About.delete_all if About.count > 0
# about = About.new
# about.content = Faker::Lorem.paragraphs(1)
# about.introduce = Faker::Lorem.sentence
# about.name = "Kien"
# about.image_first = "about-1.jpg"
# about.image_second = "about-2.jpg"
# about.address = Faker::Address.street_address
# about.address = "0123456789"
# about.email = Faker::Internet.email
# about.quote = Faker::Lorem.sentence
# about.save
 #
 # Skill
#  Skill.delete_all
# 4.times do |i|
#   skill = Skill.new
#   skill.name = Faker::Hobbit.character
#   skill.level = (0..100).to_a.sample
#   skill.save
# end
# Portfolio
# PortfolioDetail.delete_all
# Portfolio.delete_all
# images = %W(http://thuthuat123.com/uploads/2018/01/17/hinh-nen-dep-2018-s16_022534.jpg
#             http://thuthuat123.com/uploads/2018/01/17/hinh-nen-dep-2018-s48_022032.jpg
#             http://thuthuat123.com/uploads/2018/01/17/hinh-nen-dep-2018-s50_022743.jpg
#             http://thuthuat123.com/uploads/2018/01/17/hinh-nen-dep-2018-s40_025333.jpg
#             http://thuthuat123.com/uploads/2018/01/17/hinh-nen-dep-2018-s33_023418.jpg
#             http://thuthuat123.com/uploads/2018/01/17/hinh-nen-dep-2018-s29_023749.jpg)
# 6.times do |i|
#   p = Portfolio.new
#   p.name = Faker::Hobbit.character
#   p.introduce = Faker::Lorem.sentence
#   p.image = images[i + 1]
#   p.visible = true
#   p.save
# end
# images = %W(https://zing4u.vn/image/files/4-2014/Zing4u.Vn_hinh_nen_dep_dien_thoai_1.jpg
#             https://zing4u.vn/image/files/4-2014/Zing4u.Vn_hinh_nen_dep_dien_thoai_2.jpg
#             https://zing4u.vn/image/files/4-2014/Zing4u.Vn_hinh_nen_dep_dien_thoai_3.jpg
#             https://zing4u.vn/image/files/4-2014/Zing4u.Vn_hinh_nen_dep_dien_thoai_21.jpg
#             https://zing4u.vn/image/files/4-2014/Zing4u.Vn_hinh_nen_dep_dien_thoai_124.jpg)
# image_url = "https://zing4u.vn/image/files/4-2014/Zing4u.Vn_hinh_nen_dep_dien_thoai_"
# index = 1
# Portfolio.all.each do |p|
#   a = (1..10).to_a.sample
#   10.times.each do |i|
#     img = p.portfolio_details.build
#     img.introduce = Faker::Lorem.sentence
#     img.image = "#{image_url}#{index}.jpg"
#     img.save
#     index += 1
#   end
# end

User.create(email: "kien.arch92@gmail.com", password: "12345678901", password_confirmation: "12345678901")
