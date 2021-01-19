require "rails_helper"

RSpec.describe "CollegesController", type: :request do

  before do
    @user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue", admin: true)
    post login_path, :params => { :session => { email: "blue@gmail.com", password: "passwordblue" }}
  end

  # describe "GET /show" do
  #   it "Show College" do
  #     get colleges_path(@college)
  #     college = College.create!(name: "kamaraj college")
  #     expect(response.body).to include("kamaraj college")
  #   end
  # end

  describe "GET /index" do
    it "Colleges Index" do
      get colleges_path
      expect(response.body).to include("College List")
    end
  end

  describe "GET /new" do
    it "New College" do
      get new_college_path
      expect(response.body).to include("Create New College")
    end
  end

  describe "POST /edit" do
    it "Edit College" do
      college = College.create!(name: "kamaraj college")
      get edit_college_path(college)
      expect(response.body).to include("Update College")
    end
  end

  describe "POST /create" do
    it "Create College" do
      expect {post colleges_path, :params => { :college => {name: "kamaraj college" }}}
                                            .to change(College, :count).by(1)
      college = College.last
      expect(College.last.name).to eql("kamaraj college")
    end

    it "Create College" do
      expect {post "/colleges", :params => { :college => {name: "kamaraj college" }}}
                                            .to change(College, :count).by(1)
      college = College.last
      college2 = College.create!(name: "psna college")
      expect(response).to redirect_to(college_path(college)) 
    end

    it "Should render new if can't create college" do
      post "/colleges", :params => { :college => {name: "" }}
      expect(response.body).to include("Create New College")
    end
  end

  describe "PATCH /update" do
    it "Update College" do
      college = College.create!(name: "kamaraj college")
      patch college_path(college), :params => { :college => {name: "psna college"}}
      expect(College.last.name).to eql("psna college")
    end

    it "Update College" do
      college = College.create!(name: "kamaraj college")
      patch "/colleges/#{college.id}", :params => { :college => {name: "psna college"}}
      expect(response).to redirect_to(college_path(college))
    end

    it "Should render edit if can't edit college" do
      post "/colleges", :params => { :college => {name: "" }}
      expect(response.body).to include("Oops! The Following errors prevented from being saved")
    end
  end
end