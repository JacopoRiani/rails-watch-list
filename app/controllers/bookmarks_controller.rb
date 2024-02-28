class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]

  def new
    @bookmark = Bookmark.new
  end

  def show
    @bookmark = bookmark.find(params[:id])
  end

  def create
    @bookmarks = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.save
    redirect_to new_bookmark_path(@list)
  end

  def destroy
    @bookmark = bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to bookmarks_path, status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie)
  end
end
