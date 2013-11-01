module Api
  class BooksController < ApplicationController
    def index
      render json: Book.all, root: false
    end

    def create
      Book.create_book(params[:title], params[:author])
      render nothing: true
    end
  end
end
