require 'rails_helper'

feature "Add comment" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:deck) { FactoryGirl.create(:deck, user: user) }

  scenario 'clicking  Add Comment should submit a comment when signed in ' do
    sign_in(user)
    visit deck_path(deck)
    fill_in 'Add Comment', with: "Test comment"
    choose("comment_rating_1")
    click_button "Submit"

    expect(page).to have_content("Test comment")
  end

  scenario 'Adding a comment with a blank body' do
    sign_in(user)
    visit deck_path(deck)
    fill_in 'Add Comment', with: ""
    choose("comment_rating_1")
    click_button "Submit"

    expect(page).to have_content("Comment did not save.")
  end

  scenario 'Adding a comment with a blank rating' do
    sign_in(user)
    visit deck_path(deck)
    fill_in 'Add Comment', with: "test"
    click_button "Submit"

    expect(page).to have_content("Comment did not save.")
  end

  scenario 'Unauthenticated user attempts to add comment' do
  visit deck_path(deck)

  expect(page).to_not have_content("Submit a comment")
  end

  scenario "unauthenitcated user attempts to submit review" do
    visit deck_path(deck)

    click_button "Submit"
    expect(page).to have_current_path(new_user_session_path)
    expect(page).to have_content("Please log in to use this feature")
    expect(page).to have_content("Log in")
    expect(page).to_not have_content(deck.name)
  end
end
