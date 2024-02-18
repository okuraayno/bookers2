class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit]
  def create
    @user = current_user
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      render :index
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
    is_matching_login_user
    @books = Book.find(params[:id])
  end

  def update
    @books = Book.find(params[:id])
    if @books.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@books.id)
    else
      render :edit
    end
  end
  
  def destroy
    books = Book.find(params[:id])
    books.destroy
    redirect_to books_path
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def is_matching_login_user
    @books = Book.find(params[:id])
    unless @books.user_id == current_user.id
      redirect_to books_path
    end
  end
end
