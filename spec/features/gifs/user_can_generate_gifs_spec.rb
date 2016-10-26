require 'rails_helper'

describe "User generates a new gif" do
  scenario "a user can generate a new gif" do
    category = Category.create(search_term: "Puppes")


    visit new_gif_path

    fill_in "search_term", with: "Puppes"
    click_button "Submit"

    expect(current_path).to eq("/gifs/1")
    expect(page).to have_content("You generated a new gif!")
    expect(page).to have_content("Gif Index")
    expect(Gif.count).to eq(1)
  end
end
