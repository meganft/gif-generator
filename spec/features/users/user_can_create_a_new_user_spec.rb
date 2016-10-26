require 'rails_helper'

describe "User creates a new user account" do
  scenario "a user can create a new user account" do
    visit new_user_path

    fill_in "user[username]", with: "Megan"
    fill_in "user[email]", with: "email@mail.com"
    fill_in "user[password]", with: "password"

    click_button "Create User"

    expect(current_path).to eq("/users/#{User.last.id}")
    expect(page).to have_content("You created a new account!")
    expect(page).to have_content("Welcome Megan")
    expect(User.count).to eq(1)
  end

  scenario "a user tries to create an account with an existing email" do
    user = User.create(username: "Megan", email: "email@mail.com", password: "password")

    visit new_user_path

    fill_in "user[username]", with: "Bob"
    fill_in "user[email]", with: "email@mail.com"
    fill_in "user[password]", with: "password"

    click_button "Create User"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Login Here:")
    expect(page).to have_content("User already exists. Please login.")
    expect(User.count).to eq(1)
  end

  scenario "a user tries to create an account without all fields" do

    visit new_user_path

    fill_in "user[username]", with: "Bob"
    fill_in "user[email]", with: "email@mail.com"

    click_button "Create User"

    expect(page).to have_content("Create a New User")
    expect(page).to have_content("Please fill in all fields.")
    expect(User.count).to eq(0)
  end
end
