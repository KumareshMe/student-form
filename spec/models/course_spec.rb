require "rails_helper"

RSpec.describe Course, type: :model do

  describe "validations" do

    it "course name should be present" do
      subject = Course.new(name: "Mechanical Engineering")
      expect(subject).to be_valid
    end

    it "course name should be minimum of 3 characters" do
      subject = Course.new(name: "ME")
      expect(subject).not_to be_valid
    end
    
    it "course name should be maximum of 25 characters" do
      subject = Course.new(name: "Mechanical Engineering Department")
      expect(subject).not_to be_valid
    end
    
    it "course name should be unique" do
      subject = Course.new(name: "Mechanical Engineering")
      subject.save
      subject2 = Course.new(name: "Mechanical Engineering")
      expect(subject2).not_to be_valid
    end

  end
end