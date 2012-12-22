namespace :db do

	desc "Fill database with sample data"
	
	task populate: :environment do
		
		#create an admin user
		admin = User.create!(name: "Example User",
			email: "example@railstutorial.org",
			password: "foobar",
			password_confirmation: "foobar")

		admin.toggle!(:admin)

		#create additional 99 users with fake names
		99.times do |n|
			name = Faker::Name.name
			email = "example-#{n+1}@railstutorial.org"
			password = "password"
			
			User.create!(name: name,
				email: email,
				password: password,
				password_confirmation: password)
		end

		#for the first 6 years add 50 microposts each
		users = User.all(limit: 6)
		50.times do
			content = Faker::Lorem.sentence(5)
			users.each { |user| user.microposts.create!(content: content) }
		end
	end

end