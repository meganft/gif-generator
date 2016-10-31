require 'rails_helper'

describe Favorite  do
  describe "relationships" do
    it "belongs to gif" do
      favorite = Favorite.new(user_id:1, gif_id:1)
      expect(favorite).to respond_to(:gif)
    end
    it "belongs to user" do
      favorite = Favorite.new(user_id:1, gif_id:1)
      expect(favorite).to respond_to(:user)
    end
  end
end
