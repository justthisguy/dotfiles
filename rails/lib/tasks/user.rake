# lib/tasks/user.rake
namespace :user do
  desc "Create a new user"
  task create: :environment do
    user = FactoryBot.create(:user)
    # rodauth = Rodauth::Rails.new
    # rodauth.create_account!(user.email, user.password)
  end

  desc "Create the first new user"
  task create_first: :environment do
    user = FactoryBot.create(:user, email: 'foo@bar.com', password: 'asdfasdf', status: 'verified')
    profile = user.profile
    profile.image = 'jeff.jpg'
    profile.name_given = 'jeff'
    profile.save
  end
end