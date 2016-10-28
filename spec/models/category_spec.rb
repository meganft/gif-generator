require 'rails_helper'

describe Category do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a search_term" do
        category = Category.new()
        expect(category).to be_invalid
      end
      it "is invalid without a unique search_term" do
        category = Category.create(search_term: "software")
        category2 = Category.new(search_term: "software")
        expect(category2).to be_invalid
      end
    end
    context "valid attributes" do
      it "is valid with correct attributes" do
        category = Category.new(search_term: "software")
        expect(category).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many gifs" do
      category = Category.new(search_term: "software")
      expect(category).to respond_to(:gifs)
    end
  end
end
