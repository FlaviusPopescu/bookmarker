class BookmarksController < ApplicationController

  helper_method :bookmark, :bookmarks

  def index
  end

  def new
  end

  def create
    @bookmark = current_user.bookmarks.new(permited_params)

    if @bookmark.save!
      redirect_to bookmarks_path, notice: 'Succesfully added bookmark'
    else
      render 'new'
    end
  end

  private

  def bookmarks
    @bookmarks ||= current_user.bookmarks
  end

  def bookmark
    @bookmark ||= Bookmark.new
  end

  def permited_params
    params.require(:bookmark).permit(:bookmark, :user_id, :tag_tokens)
  end

end
