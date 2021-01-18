require "rails_helper"

RSpec.describe User, type: :model do

  describe "validations" do

    it "User details should be present" do
      user = User.create(username: "blue", email: "blue@gmail.com", password: "passwordblue")
      expect(user).to be_valid
    end

    it "username present and email absent" do
			user = User.new(username: "blue", email: "", password: "passwordblue")
			expect(user).not_to be_valid
		end
		
		it "username absent and email present" do
			user = User.new(username: "", email: "blue@gmail.com", password: "passwordblue")
			expect(user).not_to be_valid
		end

		it "username and email present, password absent" do
			user = User.new(username: "blue", email: "blue@gmail.com", password: "")
			expect(user).not_to be_valid
		end

		it "username should be minimum of 3 characters" do
			user = User.new(username: "aa", email: "blue@gmail.com", password: "passwordblue")
			expect(user).not_to be_valid
		end

		it "username should be maximum of 20 characters" do
			user = User.new(username: "The name was automatically shortened", email: "blue@gmail.com", password: "passwordblue")
			expect(user).not_to be_valid
		end

		it "email should be maximum of 35 characters" do
			user = User.new(username: "blue", email: "The name was automatically shortenedblue@gmail.com", password: "passwordblue")
			expect(user).not_to be_valid
		end

		it "username should be unique" do
			user = User.new(username: "blue", email: "blue@gmail.com", password: "passwordblue")
			user.save
			user2 = User.new(username: "Blue", email: "blue@gmail.com", password: "passwordblue")
			expect(user2).not_to be_valid
		end

		it "email should be unique" do
			user = User.new(username: "blue", email: "blue@gmail.com", password: "passwordblue")
			user.save
			user2 = User.new(username: "Blue", email: "Blue@gmail.com", password: "passwordblue")
			expect(user2).to be_valid
    end
    
  end
end