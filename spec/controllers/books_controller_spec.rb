require 'spec_helper'

describe Api::BooksController do
  describe "GET index" do
    it "renders empty json if there are no books" do
      get :index
      expect(response.body).to eq([].to_json)
    end

    it "renders json of all books" do
      Book.create title: "title", author: "author"
      books = [
        { id: 1, title: "title", author: "author" }
      ].to_json
      get :index
      expect(response.body).to eq(books)
    end
  end

  describe "POST create" do
    it "renders empty response" do
      Book.stub(:create_book).and_return(true)
      post :create
      expect(response.body).to eq(" ")
    end

    it "creates new book" do
      Book.stub(:create_book).and_return(true)
      Book.should_receive(:create_book).with("title", "author")
      post :create, { title: "title", author: "author" }
    end
  end
end
