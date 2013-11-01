require 'spec_helper'

feature "User adds new book to the list", js: true do
  scenario "user adds new book" do
    visit "/#/books"
    fill_in "title", with: "hello"
    fill_in "author", with: "me"
    click_on "save"
    expect(page).to have_content("hello - me")
  end

  scenario "user sees the list of books from server" do
    Book.create title: "first", author: "me"
    Book.create title: "second", author: "you"
    visit("/#/books")
    expect(page).to have_content("first - me")
    expect(page).to have_content("second - you")
  end
end
