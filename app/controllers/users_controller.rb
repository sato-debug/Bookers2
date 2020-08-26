  class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :correct_user,   only: [:edit, :update]

  def index
    @users = User.all
    @user = current_user
    @books = Book.all
    @book = Book.new
  end
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to @book, notice:'You have creatad book successfully.'
    else
    @books = Book.all
    @users = User.all
    @user = current_user
    render :index
    end
  end


  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  	redirect_to user_path(@user.id), notice:'You have updated book successfully.'
    else
    render :edit
    end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :profile_image ,:introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(current_user) unless @user == current_user
  end
end
