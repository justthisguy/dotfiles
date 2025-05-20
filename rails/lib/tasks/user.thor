class User < Thor
  desc "create User from email", "Create a User record in the database identified with the given email"
  def create(email)
    user = FactoryBot.create(:user, email: email)
  end

  desc "create First User", "Create the 'first' User"
  def create(email)
    user = FactoryBot.create(:user, email: 'foo@bar.com', password: 'asdfasdf', status: 'verified')
    profile.image = 'jeff.jpg'
    profile.name_given = 'jeff'
  end
end
