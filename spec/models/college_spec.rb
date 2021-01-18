require "rails_helper"

RSpec.describe College, type: :model do

  describe "validations" do

    it "college name should be present" do
      subject = College.new(name: "kamaraj college")
      expect(subject).to be_valid
    end

    it "college name should be minimum of 3 characters" do
      subject = College.new(name: "ka")
      expect(subject).not_to be_valid
    end
    
    it "college name should be maximum of 25 characters" do
      subject = College.new(name: "kamaraj college of engineering and technology")
      expect(subject).not_to be_valid
    end
    
    it "college name should be unique" do
      subject = College.new(name: "kamaraj college")
      subject.save
      subject2 = College.new(name: "kamaraj college")
      expect(subject2).not_to be_valid
    end

  end
end