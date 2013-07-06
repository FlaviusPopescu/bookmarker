class TagsController < ApplicationController
  respond_to :json

  def index
    if params[:query] == ''
      respond_with []
    else
      respond_with tags.tokens(params[:query])
    end
  end

  private

  def tags
    @tags = Tag.order_by_title.limit(5)
  end

end
