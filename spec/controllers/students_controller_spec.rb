require "rails_helper"

RSpec.describe "StudentsController", type: :request do

  before do
    @user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
    post login_path, :params => { :session => { email: "blue@gmail.com", password: "passwordblue" }}
  end

  describe "GET /index" do
    it "Index Student" do
			get students_path
			expect(response.body).to include("STUDENT DETAILS")
		end
  end

  # describe "GET /show" do
  #   it "Show Student" do
  #     student = Student.create!(student_name: "kumar", email_id: "kumar@gmail.com", address: "Hi I am Kumar",
  #                           contact_number: "9876543210", marks: "456", user_id: @user.id)
  #     get student_path(student)
  #     expect(response.body).to include("EDIT YOUR FORM")
  #   end
  # end

  describe "GET /new" do
    it "New Student" do
      get new_student_path
      expect(response.body).to include("Fill the Application Form")
    end
  end


end