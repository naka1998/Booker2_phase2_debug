class SearchController < ApplicationController
  def search
    target = params[:target].to_i
    body = params[:body]
    @book = Book.new
    case target
      when 1
        @users = User.where(name: body)
        render "users/index"
      when 2
        @books = Book.where(title: body)
        render "books/index"
      else
        redirect_back(fallback_location: root_path)
    end
  end
end
