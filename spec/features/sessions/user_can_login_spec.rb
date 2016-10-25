require 'rails_helper'

describe "User login" do
  scenario "a user can log in to existing account" do
    user = User.create(username: "Megan", email: "email@mail.com", password_digest: "password")

    visit login_path

    fill_in "email", with: "email@mail.com"
    fill_in "password_digest", with: "password"

    click_button "Login"

    expect(current_path).to eq("/users/#{user.id}")
    expect(page).to have_content("Welcome Megan")
  end

  scenario "a user tries to login with the wrong password" do
    user = User.create(username: "Megan", email: "email@mail.com", password_digest: "password")

    visit login_path

    fill_in "email", with: "email@mail.com"
    fill_in "password_digest", with: "12345"

    click_button "Login"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Please try again.")
    expect(page).to have_content("Login Here")
  end
end
