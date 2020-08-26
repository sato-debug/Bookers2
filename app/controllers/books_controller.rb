class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user,   only: [:edit, :update]

  def index
  	@books = Book.all
  	@book = Book.new
    @user = current_user
  end

  def show
    @books = Book.find(params[:id])
  	@book = Book.new
    @user = @books.user
  end

  def create
  	@book = Book.new(book_params)
    @book.user_id = current_user.id
  	if @book.save
  	redirect_to @book, notice:'You have creatad book successfully.'
    else
    @books = Book.all
    @user = @book.user
    render :index
    end
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
  	if @book.update(book_params)
  	redirect_to @books, notice:'You have updated book successfully.'
    else
    render :edit
    end
  end

  def destroy
  	@book = Book.find(params[:id])
  	if @book.destroy
    redirect_to @book
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_user
    @books = Book.find(params[:id])
    @user = @books.user
    redirect_to(books_path) unless @user == current_user
  end

end