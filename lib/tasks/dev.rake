namespace :dev do

  task :fake => :environment do
    users = []
    10.times do
      users << User.create!( :email => Faker::Internet.email, :password => "111111")
    end

    50.times do |i|
      post = Comment.create!( :content => Faker::Lorem.paragraph,
                            :user_id => users.sample.id,
                            :product_id => Product.all.sample.id )

    end
  end
end
