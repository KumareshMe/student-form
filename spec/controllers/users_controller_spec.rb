require "rails_helper"

RSpec.describe "UsersController", type: :request do

  describe "GET /show" do
    it "Show User" do
      user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
      post login_path, :params => { :session => { email: "blue@gmail.com", password: "passwordblue" }}
      get user_path(user)
      expect(response.body).to include("Application Form")
    end
  end

  describe "GET /new" do
    it "New User" do
      get signup_path
      expect(response.body).to include("Create your Profile")
    end
  end
  
  describe "GET /edit" do
    it "Edit User" do
      user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
      post login_path, :params => { :session => { email: "blue@gmail.com", password: "passwordblue" }}
      get edit_user_path(user)
      expect(response.body).to include("Update account")
    end
  end

  describe "POST /create" do
    it "Create User" do
      expect { post users_path, :params => { :user => { username: "blue", email: "blue@gmail.com", password: "passwordblue"}}}
                                                        .to change(User, :count).by(1)
      user = User.last
      expect(User.last.username).to eql("blue")
    end

    it "Create Test" do
      post "/users", :params => { :user => { username: "blue", email: "blue@gmail.com", password: "passwordblue"}}
      expect(response).to redirect_to(new_student_path)
    end

    it "Should render new if can't create user" do
      post users_path, :params => { :user => { username: "", email: "blue@gmail.com", password: "passwordblue"}}
      expect(response.body).to include("Create your Profile")
      expect(response.body).to include("Oops! The Following errors prevented from being saved")
    end
  end

  describe "PATCH /update" do
    it "Update User" do
      user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
      post login_path, :params => { :session => { email: "blue@gmail.com", password: "passwordblue" }}
      patch user_path(user), :params => { :user => { username: "blues", email: "blue@gmail.com", password: "passwordblue"}}
      expect(User.last.username).to eql("blues")
    end

    it "Update User" do
      user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
      post login_url, :params => { :session => { email: "blue@gmail.com", password: "passwordblue" }}
      patch user_path(user), :params => { :user => { username: "blues", email: "blues@gmail.com", password: "passwordblues"}}
      expect(response).to redirect_to(user_path(user))
    end

    it "Should render edit if can't update user" do
      post users_path, :params => { :user => { username: "", email: "blue@gmail.com", password: ""}}
      expect(response.body).to include("Oops! The Following errors prevented from being saved")
    end
  end

end