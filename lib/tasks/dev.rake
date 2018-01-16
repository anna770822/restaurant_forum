namespace :dev do 
  task :fake_restaurant => :environment do
    Restaurant.destroy_all
    500.times do |i|

      Restaurant.create!(name: FFaker::Name.first_name, tel: FFaker::PhoneNumber.short_phone_number, 
        address: FFaker::Address.street_address, opening_hours: FFaker::Time.datetime, 
        description: FFaker::Lorem.paragraph, category_id: Category.all.sample.id)
    end
    puts "fake restaurant data created"
    puts "there were #{Restaurant.count} restaurants created"
  end

  task :fake_user => :environment do
    User.destroy_all
    20.times do |i|
      user_name = FFaker::Name.first_name
      User.create!(email: "#{user_name}@example.com", password: FFaker::IdentificationMX.curp, name: user_name )
    end
    puts "fake user has been create"
    puts "there were #{User.count} users"

  end
  task :fake_comment => :environment do
    Comment.destroy_all
    Restaurant.all.each do |restaurant|
      3.times do |i|
        restaurant.comments.create!(content: FFaker::HipsterIpsum.paragraph, user: User.all.sample )
      end
    
    end
    puts "#{Comment.count} comment created"
  end
end