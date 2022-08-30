require 'rails_helper'

RSpec.describe User, type: :model do
  describe "shoudl be created with a password and password_confirmation " do
    it "returns new user " do 
      user = User.new(
        first_name: "wesley",
        last_name: "wei",
        email: "test@test.ca",
        password: "testtest",
        password_confirmation: "testtest"
      )
      expect(user).to be_valid
    end  
  end 

  describe "should fail to save if password and password_confirmation unmatch" do 
    it "returns new user " do 
        user = User.new(
          first_name: "wesley",
          last_name: "wei",
          email: "test1@test.ca",
          password: "test",
          password_confirmation: "test2"
        )
        expect(user).to_not be_valid
    end    
  end 

  describe "should fail to save if no password and password_confirmation" do 
    it "returns new user " do 
        user = User.new(
          first_name: "wesley",
          last_name: "wei",
          email: "test1@test.ca"
  
        )
        expect(user).to_not be_valid
    end    
  end 

  describe "should fail to save because email used" do 
    it "returns Email has already been taken" do 
      user = User.new(
        first_name: "wesley",
        last_name: "wei",
        email: "test@test.ca",
        password: "testtest",
        password_confirmation: "testtest"
      )
      user.save
      user1 = User.new(
        first_name: "wesley",
        last_name: "wei",
        email: "TEST@TEST.CA",
        password: "testtest",
        password_confirmation: "testtest"
      )
      user1.save 
      expect(user1.errors.full_messages[0]).to eql("Email has already been taken")
    end    
  end
  
  describe "Email, first name, last should be required" do
    it "returns First name can't be blank" do 
        user = User.new(
         
        last_name: "wei",
        email: "test@test.ca",
        password: "test",
        password_confirmation: "test"
        )
        user.save
        expect(user.errors.full_messages[0]).to eql("First name can't be blank")
    end
    
    it "returns last name can't be blank" do
      user = User.new(
        first_name: "wesley",
      
        email: "test@test.ca",
        password: "test",
        password_confirmation: "test"
      )
      user.save
      expect(user.errors.full_messages[0]).to eql("Last name can't be blank")
    end 

    it "returns Email can't be blank" do
      user = User.new(
        first_name: "wesley",
        last_name: "wei",
       
        password: "test",
        password_confirmation: "test"
      )
      user.save
      expect(user.errors.full_messages[0]).to eql("Email can't be blank")
    end 
  end 

  describe "Password has min lenghth of 6 digits" do 
    it "returns Password is too short (minimum is 6 characters)" do 
      user = User.new(
        first_name: "wesley",
        last_name: "wei",
        email: "test@test.ca",
        password: "test",
        password_confirmation: "test"
      )
      user.save
      expect(user.errors.full_messages[0]).to eql("Password is too short (minimum is 6 characters)")
    end 
  end 


end
