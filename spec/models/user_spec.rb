require 'rails_helper'

describe User do
  describe "validations" do
    context "invalid attributes" do

      it "is invalid without a username" do
        user = User.new(email: "mail@mail.com", password: "Password")
        expect(user).to be_invalid
      end

      it "is invalid without an email" do
        user = User.new(username: "User", password: "Password")
        expect(user).to be_invalid
      end

      it "is invalid without an password" do
        user = User.new(username: "User", email: "mail@mail.com")
        expect(user).to be_invalid
      end
    end
    context "valid attributes" do
      it "is valid with correct attributes" do
        user = User.new(username: "User", email: "mail@mail.com", password: "Password")
        expect(user).to be_valid
      end
    end
  end
end
