class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def new

  end

  def create
   book = Book.new(book_params)
   if book.save
     flash[:notice] = "Book was successfully created."
     redirect_to book_path(book.id)
   else

   end
  end



  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if flash[:notice] = "Book was successfully updated."
       book.update(book_params)
       redirect_to book_path(book)
    else

    end
  end


  def destroy
    book = Book.find(params[:id])
    flash[:notice] = "Book was successfully destroyed."
    book.destroy
    redirect_to books_path
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
