class Profile < Thor
  desc "Use FactoryBot to create a Profile ", "Create a Profile record in the database"
  def create
    Profile = FactoryBot.create :Profile
  end
end
