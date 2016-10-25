require 'rails_helper'

describe "User generates a new gif" do
  scenario "a user can generate a new gif" do

    visit new_gif_path

    fill_in "category[search_term]", with: "Dog"

    click_button "Generate GIF"

    expect(current_path).to eq("/gifs")
    expect(page).to have_content("You generated a new gif!")
    expect(page).to have_content("Gif Index")
    expect(Gif.count).to eq(1)
  end
end
