class BooksController < ApplicationController
  def index
    # your code here
    @books = Book.all
  end

  def new
    # your code here
  end

  def create
    book = Book.new(book_params)
    book.save!
    redirect_to :books
  end

  def destroy
    book = Book.find_by(id: params[:id])

    if book.destroy
      redirect_to :books
    end

  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
