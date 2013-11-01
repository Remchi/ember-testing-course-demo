class Book < ActiveRecord::Base
  def self.create_book(title, author)
    book = Book.new(title: title, author: author)
    book.save
  end
end
