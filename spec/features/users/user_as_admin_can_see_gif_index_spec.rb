require 'rails_helper'
require 'giphy'

describe "User generates a new gif" do
  scenario "a user as an admin generate a new gif" do
    category = Category.create(search_term: "Puppies")
    user = User.create(username: "Megan", email: "email@email.com", password: "1234", role: 1)

    visit admin_gifs_path

    expect(current_path).to eq("/admin/gifs")
    expect(page).to have_content("Admin Gifs Index")
  end
end
