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
  {index: 1, title: 'GENANX闪电潮牌黑白拼接五分袖几何图案2017夏装男新款纯棉t恤男', description: '颜色: 黑白色
版型: 宽松
袖型: 五分袖
面料类型: 纯棉
尺码推荐: 尺码请参考【左边第三张图片处尺码表】，如宽松版则建议拍小一码，如标准版按原穿着习惯拍',
price: 98, position: 1, color: 0, image: open("http://oqyn5ink5.bkt.clouddn.com/02-B-geometry_square-00.jpg")},
  {index: 2, title: '西坂 2017夏装新款男装 男士衣服 t恤男短袖 纯棉男式圆领T恤', description: '颜色：白色
版型: 修身
袖型: 短袖
面料成分: 100%棉
注意事项: 尺寸选择右侧的“尺码对照表”为标准尺码表，不适用于本商品，正确的尺码表在左侧的图片中。
选用优质纯棉面料，柔软透气，穿着舒适。
修身版型，如果喜欢宽松一点，建议买大一码。',
price: 99, position: 2, color: 1, image: open("http://oqyn5ink5.bkt.clouddn.com/01-W-clock-00.jpg")},
    {index: 2, title: '西坂 2017夏装新款男装 男士衣服 t恤男短袖 纯棉男式圆领T恤', description: '颜色：白色
      颜色: 黑色
      版型: 宽松
      袖型: 短袖
      尺码推荐: 尺码请参考【左边第三张图片处尺码表】，如宽松版则建议拍小一码，如标准版按原穿着习惯拍',
       price: 99, position: 3, color: 0, image: open("http://oqyn5ink5.bkt.clouddn.com/02-B-poker-00.jpg")},
      {index: 2, title: '西坂 2017夏装新款男装 男士衣服 t恤男短袖 纯棉男式圆领T恤', description: '【100%纯棉 百搭T恤】YUYOM优央 男士短袖圆领印花T恤 100%纯棉面料 时尚字母印花T恤 宽松薄款 YT170406
颜色: 黑色/白色
领型: 圆领
袖型: 短袖
面料类型: 100%棉
尺码选择：请参考左侧主图尺码表
颜色：白色、黑色
品名：男士圆领短袖T恤 YT170406
设计理念：简约 时尚 百搭 不挑人的基础款，实属经典必败款 胸前的胶浆压印，360°的设计感 给沉闷的夏天带来一丝丝不一样的腔调 无论从正面还是侧面， 更显时尚和自信 100%纯棉面料 60S支纱织造 浅圆领设计，修饰颈部肌肉线条 配合整体版型，显年轻且时尚 变化的是潮流，不变的是经典 黑白两色，百搭
特点：袖口双线绗缝设计，实用且美观大方，穿着轻松舒适缝制工整，双线倒针做工，针脚细腻，不易脱线个性3D胶浆压印，将字母与符号拼凑成大小不一的色块，兼具时尚美观的同时更能捕捉到潮人。',
price: 98, position: 4, color: 0, image: open("http://oqyn5ink5.bkt.clouddn.com/02-B:W-letters_quare-00.jpg")},
        {index: 2, title: '西坂 2017夏装新款男装 男士衣服 t恤男短袖 纯棉男式圆领T恤', description: '颜色：白色
版型: 修身
袖型: 短袖
面料成分: 100%棉
注意事项: 尺寸选择右侧的“尺码对照表”为标准尺码表，不适用于本商品，正确的尺码表在左侧的图片中。
选用优质纯棉面料，柔软透气，穿着舒适。
修身版型，如果喜欢宽松一点，建议买大一码。',
price: 99, position: 5, color: 0, image: open("http://oqyn5ink5.bkt.clouddn.com/01-B-clock-00.jpg")},
          {index: 2, title: '西坂 2017夏装新款男装 男士衣服 t恤男短袖 纯棉男式圆领T恤', description: '颜色: 白色
版型: 修身
领型: 圆领
袖型: 短袖
面料类型: 棉
面料成分: 棉
有趣的印花~个性十足',
 price: 98, position: 6, color: 1, image: open("http://oqyn5ink5.bkt.clouddn.com/01-W-cartoon_look-00.jpg")},
            {index: 2, title: '西坂 2017夏装新款男装 男士衣服 t恤男短袖 纯棉男式圆领T恤', description: '袖型: 短袖
面料类型: 棉
注意事项: 尺码请参考【左边图片处尺码表】；
全新95%棉男T恤 透气轻薄 面料舒适
产品持续上新，搜索【豪柏】发现惊喜多优款式。',
 price: 99, position: 7, color: 0, image: open("http://oqyn5ink5.bkt.clouddn.com/02-B-letter_teardown-00.jpg")},
              {index: 2, title: '西坂 2017夏装新款男装 男士衣服 t恤男短袖 纯棉男式圆领T恤', description: '版型: 宽松
领型: 圆领
袖型: 短袖
闭合方式: 无扣
面料类型: 95%棉 5%涤纶
注意事项: 请按实际穿衣尺寸对比图文尺码图购买。
棉质布料，亲肤细腻，自然舒展不变形',
 price: 98, position: 8, color: 1, image: open("http://oqyn5ink5.bkt.clouddn.com/02-B-letter_teardown-00.jpg")},
                {index: 2, title: '西坂 2017夏装新款男装 男士衣服 t恤男短袖 纯棉男式圆领T恤', description: '版型: 宽松
领型: 圆领
袖型: 短袖
闭合方式: 无扣
面料类型: 95%棉 5%涤纶
注意事项: 请按实际穿衣尺寸对比图文尺码图购买。
棉质布料，亲肤细腻，自然舒展不变形',
price: 99, position: 9, color: 0, image: open("http://oqyn5ink5.bkt.clouddn.com/01-B-cartoon_dabai-00.jpg")}
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
  },
  { index: 3,
    photos:[
      open("http://oqyn5ink5.bkt.clouddn.com/02-B-poker-01.jpg"),
      open("http://oqyn5ink5.bkt.clouddn.com/02-B-poker-02.jpg"),
      open("http://oqyn5ink5.bkt.clouddn.com/02-B-poker-03.jpg"),
      open("http://oqyn5ink5.bkt.clouddn.com/02-B-poker-04.jpg"),
      open("http://oqyn5ink5.bkt.clouddn.com/02-B-poker-05.jpg"),
      open("http://oqyn5ink5.bkt.clouddn.com/02-B-poker-06.jpg"),
      open("http://oqyn5ink5.bkt.clouddn.com/02-B-poker-07.jpg"),
      open("http://oqyn5ink5.bkt.clouddn.com/02-B-poker-08.jpg")
    ]
  },
  { index: 4,
    photos:[
      open("http://oqyn5ink5.bkt.clouddn.com/02-B:W-letters_quare-01.jpg"),
      open("http://oqyn5ink5.bkt.clouddn.com/02-B:W-letters_quare-02.jpg"),
      open("http://oqyn5ink5.bkt.clouddn.com/02-B:W-letters_quare-03.jpg"),
      open("http://oqyn5ink5.bkt.clouddn.com/02-B:W-letters_quare-04.jpg"),
      open("http://oqyn5ink5.bkt.clouddn.com/02-B:W-letters_quare-05.jpg")
    ]
  },
  { index: 5,
    photos:[
      open("http://oqyn5ink5.bkt.clouddn.com/01-B-clock-01.jpg"),
      open("http://oqyn5ink5.bkt.clouddn.com/01-B-clock-02.jpg"),
      open("http://oqyn5ink5.bkt.clouddn.com/01-B-clock-03.jpg")
    ]
  },
  { index: 6,
    photos:[
      open("http://oqyn5ink5.bkt.clouddn.com/01-W-cartoon_look-01.jpg"),
      open("http://oqyn5ink5.bkt.clouddn.com/01-W-cartoon_look-02.jpg"),
      open("http://oqyn5ink5.bkt.clouddn.com/01-W-cartoon_look-03.jpg")
    ]
  },
  { index: 7,
    photos:[
      open("http://oqyn5ink5.bkt.clouddn.com/02-B-letter_teardown-01.jpg"),
      open("http://oqyn5ink5.bkt.clouddn.com/02-B-letter_teardown-02.jpg"),
      open("http://oqyn5ink5.bkt.clouddn.com/02-B-letter_teardown-03.jpg"),
      open("http://oqyn5ink5.bkt.clouddn.com/02-B-letter_teardown-04.jpg"),
      open("http://oqyn5ink5.bkt.clouddn.com/02-B-letter_teardown-05.jpg"),
      open("http://oqyn5ink5.bkt.clouddn.com/02-B-letter_teardown-06.jpg")
    ]
  },
  { index: 8,
    photos:[
      open("http://oqyn5ink5.bkt.clouddn.com/01-W-cartoon_dabai-01.jpg"),
      open("http://oqyn5ink5.bkt.clouddn.com/01-W-cartoon_dabai-02.jpg"),
      open("http://oqyn5ink5.bkt.clouddn.com/01-W-cartoon_dabai-03.jpg"),
      open("http://oqyn5ink5.bkt.clouddn.com/01-W-cartoon_dabai-04.jpg")
    ]
  },
  { index: 9,
    photos:[
      open("http://oqyn5ink5.bkt.clouddn.com/01-B-cartoon_dabai-01.jpg")
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
