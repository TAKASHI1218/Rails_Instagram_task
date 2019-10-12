50.times do |n|
  name = Faker::Games::Pokemon.name
  profile= Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
               profile: profile,
               email: email,
               password: password,
               password_confirmation: password,
               )
end
