class BooksController < ApplicationController
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render books_path
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  def show
    @books = Book.find(params[:id])
    @book = Book.new
    @user = @books.user
  end
  
  def edit
    @books = Book.find(params[:id])
  end

  def update
    @books = Book.find(params[:id])
    @books.update(book_params)
    redirect_to book_path(@books.id)
  end
  
  def destroy
    books = Book.find(params[:id])
    books.destroy
    redirect_to books_path
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
