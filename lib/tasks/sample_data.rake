namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_posts
    
  end
end

def make_users
  admin = User.create!(:name => "admin",
                       :email => "admin@mail.org",
                       :password => "foobar",
                       :password_confirmation => "foobar")
  admin.toggle!(:admin)
  20.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@mail.org"
    password = "password"
    User.create!(:name => name,
                 :email => email,
                 :password => password,
                 :password_confirmation => password)
  end
end

def make_posts
  50.times do
    User.all(:limit => 6).each do |user|
      user.posts.create!(:title => Faker::Lorem.sentence(5),
                         :content => Faker::Lorem.sentence(5))
    end
  end
end


