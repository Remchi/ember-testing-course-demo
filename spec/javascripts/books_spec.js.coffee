#= require test_helper

describe "Books page", ->

  beforeEach ->
    EmberApp.reset()

  afterEach ->
    $.mockjaxClear()
    EmberApp.Book.books = []

  it "adds new book to the list", ->
    stubAjax("get", "/api/books", [])
    stubAjax("post", "/api/books", [])
    visit("/books")
      .fillIn("#title", "title")
      .fillIn("#author", "author")
      .click("#save")
      .then ->
        find("ul#books > li").length.should.equal(1)


  it "shows empty message if there are no books on server", ->
    stubAjax("get", "/api/books", [])
    visit("/books").then ->
      find(".alert-info").text().should.equal("No books yet")

  it "shows list of books", ->
    books = [
      {
        title: "book1"
        author: "author1"
      },
      {
        title: "book2"
        author: "author2"
      }
    ]
    stubAjax("get", "/api/books", books)
    visit("/books").then ->
      find(".alert-info").length.should.equal(0)
      find("ul#books > li").length.should.equal(2)

