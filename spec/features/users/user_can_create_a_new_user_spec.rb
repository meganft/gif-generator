require 'rails_helper'

describe "User creates a new user account" do
  scenario "a user can create a new user account" do
    visit new_user_path

    fill_in "user[username]", with: "Megan"
    fill_in "user[email]", with: "email@mail.com"
    fill_in "user[password_digest]", with: "password"

    click_button "Create User"

    expect(current_path).to eq("/users/#{User.last.id}")
    expect(page).to have_content("Welcome Megan")
    expect(User.count).to eq(1)
  end

  scenario "a user tries to create an account with an existing email" do
    user = User.create(username: "Megan", email: "email@mail.com", password_digest: "password")

    visit new_user_path

    fill_in "user[username]", with: "Bob"
    fill_in "user[email]", with: "email@mail.com"
    fill_in "user[password_digest]", with: "password"

    click_button "Create User"

    expect(current_path).to eq("/login")
    expect(page).to have_content("Login Here:")
    expect(User.count).to eq(1)
  end
end
