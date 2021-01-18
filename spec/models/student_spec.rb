require "rails_helper"

RSpec.describe Student, type: :model do

  describe "validations" do

    it "Students details should be present" do
      user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
      subject = Student.new(student_name: "kumar", email_id: "kumareshme2@gmail.com", address: "Hi I am kumar",
                            contact_number: "5535653453", marks: "458", user_id: user.id)
      expect(subject).to be_valid
    end

    it "email id should not be present" do
      user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
      subject = Student.new(student_name: "kumar", email_id: "", address: "Hi I am kumar",
                            contact_number: "5535653453", marks: "458", user_id: user.id)
      expect(subject).not_to be_valid
    end

    it "email id should be valid" do
      user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
      subject = Student.new(student_name: "kumar", email_id: "blue@gmailcom", address: "Hi I am kumar",
                            contact_number: "5535653453", marks: "358", user_id: user.id)
      expect(subject).not_to be_valid
    end

    it "contact number should have only 10 numbers" do
      user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
      subject = Student.new(student_name: "kumar", email_id: "blue@gmail.com", address: "Hi I am kumar",
                            contact_number: "553546543", marks: "458", user_id: user.id)
      expect(subject).not_to be_valid
    end

    it "address should not be too lengthy" do
      user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
      subject = Student.new(student_name: "kumar", email_id: "blue@gmail.com", address: "The name was automatically shortened for the time and tide waits for none so that we have to be patience",
                            contact_number: "5535465423", marks: "458", user_id: user.id)
      expect(subject).not_to be_valid
    end

    it "marks should be between 100 to 500 only" do
      user = User.create!(username: "blue", email: "blue@gmail.com", password: "passwordblue")
      subject = Student.new(student_name: "kumar", email_id: "blue@gmail.com", address: "Hi I am Kumar",
                            contact_number: "9876543210", marks: "568", user_id: user.id)
      expect(subject).not_to be_valid
    end

  end
end