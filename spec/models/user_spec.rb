require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "should successfully create new user" do
      @user = User.create(name: "kourtney", email: "kourtney@gmail.com", password: "meow", password_confirmation: "meow")
      expect(@user).to be_valid
    end

    it "name missing" do 
      @user = User.create(email: "kourtney@gmail.com", password: "meow", password_confirmation: "meow")
      expect(@user).not_to be_valid
      @user.errors.full_messages
    end

    it "email missing" do
      @user = User.create(name: "kourtney", password: "meow", password_confirmation: "meow")
      expect(@user).not_to be_valid
      @user.errors.full_messages
    end

    it "passwords don't match" do
      @user = User.create(name: "kourtney", email: "kourtney@gmail.com", password: "meow", password_confirmation: "meow1")
      expect(@user).not_to be_valid
      @user.errors.full_messages
    end

    it "email is unique" do 
      @user = User.create(name: "kourtney", email: "kourtney@gmail.com", password: "meow", password_confirmation: "meow")
      @user1 = User.create(name: "kourt", email: "KOURtney@GMAIL.com", password: "meow1", password_confirmation: "meow1")
      expect(@user1.errors[:email].first).to eq('has already been taken')
    end

    it "passwords length invalid" do
      @user = User.create(name: "kourtney", email: "kourtney@gmail.com", password: "12", password_confirmation: "12")
      expect(@user).not_to be_valid
      @user.errors.full_messages
    end

    it "password is valid" do
      @user = User.create(name: "kourtney", email: "kourtney@gmail.com", password: "meow", password_confirmation: "meow")
      expect(@user).to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it "should successfully log in with valid credentials" do
      @user = User.create(name: 'Harry', email: 'harry@test.com', password: 'harryrocks', password_confirmation: 'harryrocks')
      valid_user = User.authenticate_with_credentials("harry@test.com", "harryrocks")
      expect(valid_user).to eq(@user)
    end

    it "should not log in with invalid credentials" do
      @user = User.create(name: 'Harry', email: 'harry@test.com', password: 'harryrocks', password_confirmation: 'harryrocks')
      valid_user = User.authenticate_with_credentials("har@test.com", 'harryrocks')
      expect(valid_user).not_to eq(@user)
    end

    it "should disregard whitespace in email" do
      @user = User.create(name: 'Harry', email: 'harry@test.com', password: 'harryrocks', password_confirmation: 'harryrocks')
      @user = User.authenticate_with_credentials("  harry@test.com   ", "harryrocks")
      expect(@user).to eq(@user)
    end

    it "should not be case sensitive" do 
      @user = User.create(name: 'Harry', email: 'harry@test.com', password: 'harryrocks', password_confirmation: 'harryrocks')
      @user = User.authenticate_with_credentials("haRRY@test.com", "harryrocks")
      expect(@user).to eq(@user)
    end
  end

end
