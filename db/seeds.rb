# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.new
u.email = 'admin@test.com'           # 可以改成自己的 email

u.password = '111111'                # 最少要六码

u.password_confirmation = '111111'   # 最少要六码

u.is_admin = true
u.save

puts '1 admin account created'

group_names = ['人物', '动漫', '汉字', '英文', '实物', '其他']

create_groups = for i in 1..group_names.length do
  Group.create!([name: "#{group_names[i-1]}", number: i])
end

label_names = ['创意', '时尚', '经典', '文艺', '组合', '其他']

create_labels = for i in 1..label_names.length do
  Label.create!([name: "#{label_names[i-1]}", number: i])
end
puts "create product labels and groups"

products = [
  {title: '1 product_test', description: '衣服的质地，颜色，尺码，主题，标签等', price: 99},
  {title: '2 product_test', description: '衣服的质地，颜色，尺码，主题，标签等', price: 99},
  {title: '3 product_test', description: '衣服的质地，颜色，尺码，主题，标签等', price: 99},
  {title: '4 product_test', description: '衣服的质地，颜色，尺码，主题，标签等', price: 99},
  {title: '5 product_test', description: '衣服的质地，颜色，尺码，主题，标签等', price: 99},
  {title: '6 product_test', description: '衣服的质地，颜色，尺码，主题，标签等', price: 99},
  {title: '7 product_test', description: '衣服的质地，颜色，尺码，主题，标签等', price: 99},
  {title: '8 product_test', description: '衣服的质地，颜色，尺码，主题，标签等', price: 99}
]

create_products = for i in 1..products.length do
  Product.create!(title: products[i - 1][:title], description: products[i - 1][:description], price: rand(5..100), quantity: 100)
end

puts 'products created.'
#
# images = [
#   { index: 1,
#     image: open("#{Rails.root}/app/assets/images/idea1.jpg"),
#     photos:[
#       open("#{Rails.root}/app/assets/images/idea1.jpg"),
#       'https://ww2.sinaimg.cn/large/006tKfTcly1fg985clqakj304g04g0si.jpg'
#     ]
#   },
#   { index: 2,
#     image: "https://ww2.sinaimg.cn/large/006tKfTcly1fg985clqakj304g04g0si.jpg",
#     photos:[
#       open: "https://ww3.sinaimg.cn/large/006tKfTcly1fg9810t9bgj304g04g0si.jpg",
#       open: "https://ww3.sinaimg.cn/large/006tKfTcly1fg97lws1i4j304g04gdfl.jpg"
#     ]
#   },
#   { index: 3,
#     image: "https://ww2.sinaimg.cn/large/006tKfTcly1fg985clqakj304g04g0si.jpg",
#     photos:[
#       open: "https://ww3.sinaimg.cn/large/006tKfTcly1fg9810t9bgj304g04g0si.jpg",
#       open: "https://ww3.sinaimg.cn/large/006tKfTcly1fg97lws1i4j304g04gdfl.jpg"
#     ]
#   }
# ]
# Product.first.update!(title: "seed", image: images[0]["image"])
# Photo.create!(product_id: Product.first.id, avatar: images[0][:photos][0])
# Photo.create!(product_id: Product.first.id, avatar: images[0][:photos][1])

# insert_image = for i in 1..products.length do
#   Product.find(i).update!(image: images[i-1]["image"])
# end
#
# create_photos = for i in 1..products.length do
#   for j in 1..images[i-1][:photos].length do
#     Photo.create!(product_id: Product.find(i)[:id], avatar: images[i-1][:photos][j-1])
#   end
# end
#
# puts 'photos created.'
