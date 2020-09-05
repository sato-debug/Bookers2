class BookCommentsController < ApplicationController
	def create
		book_find = Book.find(params[:book_id])
	    comment = current_user.book_comments.new(book_comment_params)
	    comment.book_id = book_find.id
	    if comment.save
	      redirect_to book_path(book_find)
	    else
	      @book_find = Book.find(params[:book_id])
    	  @book = Book.new
	      @user = book_find.user
	      @book_comment = BookComment.new
	      render 'books/show'
	    end
	end

	def destroy
		BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    	redirect_to book_path(params[:book_id])
	end

	private

  	def book_comment_params
    	params.require(:book_comment).permit(:comment)
  	end
end

