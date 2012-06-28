namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Admin",
                         :email => "admin@mail.org",
                         :password => "foobar",
                         :password_confirmation => "foobar")
    admin.toggle!(:admin)
end
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    User.create!(:name => "Example User",
                 :email => "example@mail.org",
                 :password => "foobar",
                 :password_confirmation => "foobar")
    20.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@mail.org"
      password  = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    
  end
end
end
