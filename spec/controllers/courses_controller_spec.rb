require "rails_helper"

RSpec.describe "CoursesController", type: :request do

  before do
    @user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue", admin: true)
    post login_path, :params => { :session => { email: "blue@gmail.com", password: "passwordblue" }}
  end

  # describe "GET /show" do
  #   it "Show Course" do
  #     get course_path(course)
  #     course = Course.create!(name: "mechanical engineering")
  #     expect(response.body).to include("Course List")
  #   end
  # end

  describe "GET /index" do
    it "Courses Index" do
      get courses_path
      expect(response.body).to include("Course List")
    end
  end

  describe "GET /new" do
    it "New Course" do
      get new_course_path
      expect(response.body).to include("Create New Course")
    end
  end

  describe "POST /edit" do
    it "Edit Course" do
      course = Course.create!(name: "mechanical engineering")
      get edit_course_path(course)
      expect(response.body).to include("Update Course")
    end
  end

  describe "POST /create" do
    it "Create Course" do
      expect {post courses_path, :params => { :course => {name: "mechanical engineering" }}}
                                            .to change(Course, :count).by(1)
      course = Course.last
      expect(Course.last.name).to eql("mechanical engineering")
    end

    it "Create Course" do
      expect {post "/courses", :params => { :course => {name: "mechanical engineering" }}}
                                            .to change(Course, :count).by(1)
      course = Course.last
      course2 = Course.create!(name: "computer science")
      expect(response).to redirect_to(course_path(course)) 
    end

    it "Should render new if can't create course" do
      post "/courses", :params => { :course => {name: "" }}
      expect(response.body).to include("Create New Course")
    end
  end

  describe "PATCH /update" do
    it "Update Course" do
      course = Course.create!(name: "mechanical engineering")
      patch course_path(course), :params => { :course => {name: "computer science"}}
      expect(Course.last.name).to eql("computer science")
    end

    it "Update Course" do
      course = Course.create!(name: "mechanical engineering")
      patch "/courses/#{course.id}", :params => { :course => {name: "computer science"}}
      expect(response).to redirect_to(course_path(course))
    end

    it "Should render edit if can't edit course" do
      post "/courses", :params => { :course => {name: "" }}
      expect(response.body).to include("Oops! The Following errors prevented from being saved")
    end
  end
end