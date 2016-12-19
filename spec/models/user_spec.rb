require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryGirl.create(:user)
  end

  describe "creation" do

    it "can be created" do
      expect(@user).to be_valid
    end
  end

  describe "validations" do
    it "can not be created without first_name" do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it "can not be created without last_name" do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it "can not be created without a phone number" do
      @user.phone = nil
      expect(@user).to_not be_valid
    end
    
    it "requires the phone attr to only contain integers" do
      @user.phone = "mygreatstr"
      expect(@user).to_not be_valid
    end

    it "requires the phone attr to be exactly 10 characters long" do
      @user.phone = "12345678901"
      expect(@user).to_not be_valid
    
    end
  end

  describe "customer name method" do
    it "has a full name method that combines first and last name" do
      expect(@user.full_name).to eq("SNOW, JON")
    end
  end

  describe "relationship between admins and employees" do
    it "allows for admins to be associated with multiple employees" do

      employee1 = FactoryGirl.create(:user)
      employee2 = FactoryGirl.create(:user)
      admin = FactoryGirl.create(:admin_user)
      Hand.create!(user:admin, hand: employee1)
      Hand.create!(user:admin, hand: employee2)
      expect(admin.hands.count).to eq(2)
    end
  end

end
