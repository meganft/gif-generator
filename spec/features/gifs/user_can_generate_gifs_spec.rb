require 'rails_helper'
require 'giphy'

describe "User generates a new gif" do
  scenario "a user as an admin generate a new gif" do
    category = Category.create(search_term: "Puppies")
    user = User.create(username: "Megan", email: "email@email.com", password: "1234", role: 1)

    visit new_admin_gif_path

    fill_in "search_term", with: "Puppies"
    click_button "Submit"

    expect(current_path).to eq("/gifs/1")
    expect(page).to have_content("You generated a new gif!")
    expect(page).to have_content("Gif Index")
    expect(Gif.count).to eq(1)
  end
end
