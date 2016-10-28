require 'rails_helper'

describe "User deletes a category" do
  scenario "a user can delete a category" do
    category = Category.create(search_term: "Denver")

    visit categories_path

    expect(page).to have_content("Denver")

    within(".category_#{category.id}") do
      click_on "Delete"
    end

    expect(page).to_not have_content("Denver")

  end
end
