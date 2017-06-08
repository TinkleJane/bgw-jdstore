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


Product.delete_all

products = [
  {index: 1, title: 'title', description: 'description', price: 99, position: 1, image: open("http://oqyn5ink5.bkt.clouddn.com/02-B-geometry_square-00.jpg")},
  {index: 2, title: 'title', description: 'description', price: 99, position: 2, image: open("http://oqyn5ink5.bkt.clouddn.com/01-B-clock-00.jpg")}
]

create_products = []
for i in 1..products.length do
  create_products << Product.create!(title: products[i - 1][:title], description: products[i - 1][:description], price: rand(5..100), quantity: 100, position: products[i - 1][:position], image: products[i - 1][:image])
end

puts 'products created.'

images = [
  { index: 1,
    photos:[
      open("http://oqyn5ink5.bkt.clouddn.com/02-B-geometry_square-01.jpg"),
      open("http://oqyn5ink5.bkt.clouddn.com/02-B-geometry_square-02.jpg"),
      open("http://oqyn5ink5.bkt.clouddn.com/02-B-geometry_square-03.jpg"),
      open("http://oqyn5ink5.bkt.clouddn.com/02-B-geometry_square-04.jpg"),
      open("http://oqyn5ink5.bkt.clouddn.com/02-B-geometry_square-05.jpg"),
      open("http://oqyn5ink5.bkt.clouddn.com/02-B-geometry_square-06.jpg"),
      open("http://oqyn5ink5.bkt.clouddn.com/02-B-geometry_square-07.jpg")
    ]
  },
  { index: 2,
    photos:[
      open("http://oqyn5ink5.bkt.clouddn.com/01-B-clock-01.jpg"),
      open("http://oqyn5ink5.bkt.clouddn.com/01-B-clock-02.jpg"),
      open("http://oqyn5ink5.bkt.clouddn.com/01-B-clock-03.jpg")
    ]
  }
]

# insert_image = for i in 1..products.length do
#   Product.find(i).update!(image: images[i-1]["image"])
# end

for i in 0..create_products.length-1 do
  for j in 0..images[i][:photos].length-1 do
    Photo.create!(product_id: create_products[i][:id], avatar: images[i][:photos][j])
  end
end

puts 'photos created.'
