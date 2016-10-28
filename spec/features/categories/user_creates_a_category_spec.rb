require 'rails_helper'

describe "User creates a new category" do
  scenario "a user can create a new category" do

    visit new_category_path

    fill_in "category[search_term]", with: "Software"

    click_button "Create Category"

    expect(current_path).to eq("/categories")
    expect(page).to have_content("You created a new category!")
    expect(page).to have_content("Category Index")
    expect(Category.count).to eq(1)
  end
end
