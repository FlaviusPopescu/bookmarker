class TagsController < ApplicationController
  respond_to :json

  def index
    respond_with tags.tokens(params[:query])
  end

  private

  def tags
    @tags = Tag.order_by_title.limit(5)
  end

end
