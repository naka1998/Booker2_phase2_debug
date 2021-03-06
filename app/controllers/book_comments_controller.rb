class BookCommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @comment = current_user.book_comments.new(comment_params)
    @comment.book_id = params[:book_id]
    @comment.save
    redirect_back(fallback_location: books_path)
  end

  def destroy
    @comment = BookComment.find(params[:id])
    if correct_user?(@comment.user)
      @comment.destroy
      redirect_back(fallback_location: books_path)
    else
      redirect_back(fallback_location: books_path)
    end
  end

  private
  def comment_params
    params.require(:book_comment).permit(:body)
  end
end
