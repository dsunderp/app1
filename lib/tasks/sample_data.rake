namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(username: "deepti1991",
                 name: "deepti",
                 profile_type: "individual",
                 skills: "Ruby, C#" ,
                 password: "deepti1991",
                 password_confirmation: "deepti1991",
                admin: true)
    99.times do |n|
      name  = Faker::Name.name
      username = "ExUser-#{n+1}"
      profile = "individual"
      skills = "walk dog"
      password  = "password"
      User.create!(name: name,
                   username: username,
                   password: password,
                   password_confirmation: password,
                  profile_type: profile,
                  skills: skills)
    end
  end
end