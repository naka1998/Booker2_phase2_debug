class SearchController < ApplicationController
  def search
    target = params[:target].to_i
    body = params[:body]
    method = params[:matching_method].to_i
    @book = Book.new
    case target
      when 1
        @users = User.search(body, method)
        render "users/index"
      when 2
        @books = Book.search(body, method)
        render "books/index"
      else
        redirect_back(fallback_location: root_path)
    end
  end
end
