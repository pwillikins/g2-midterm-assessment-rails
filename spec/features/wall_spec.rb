require 'rails_helper'
require 'capybara/rails'

feature 'Wall' do

  scenario 'Users can post' do
    create_user email: "user@example.com", name: "Some User"
    create_user email: "reader@example.com", name: "Reader User"

    visit root_path
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"

    fill_in "post_body", with: "I'm doing some fun things here"
    click_on "Post"
    expect(page).to have_content("I'm doing some fun things here")

    click_link "Logout"
    fill_in "Email", with: "reader@example.com"
    fill_in "Password", with: "password"
    click_on "Login"

    expect(page).to have_content("I'm doing some fun things here")
  end

  scenario "Users can comment on a post" do
    create_user email: "user@example.com", name: "Some User"
    create_user email: "reader@example.com", name: "Reader User"

    visit root_path
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"

    fill_in "post_body", with: "I'm doing some fun things here"
    click_on "Post"
    expect(page).to have_content("I'm doing some fun things here")
    click_link "Add Comment"
    fill_in "comment[comment]", with: "Doing more fun things"
    click_on "Add Comment"
    expect(page).to have_content("Doing more fun things")
  end

  scenario "user cannot submit blank comment" do
    create_user email: "user@example.com", name: "Some User"
    create_user email: "reader@example.com", name: "Reader User"

    visit root_path
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"

    fill_in "post_body", with: "I'm doing some fun things here"
    click_on "Post"
    expect(page).to have_content("I'm doing some fun things here")
    click_link "Add Comment"
    fill_in "comment[comment]", with: ""
    click_on "Add Comment"
    expect(page).to have_content("Comment cannot be blank")
  end
end
