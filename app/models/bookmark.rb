class Bookmark < ActiveRecord::Base

  belongs_to :user
  belongs_to :site
  has_many :taggings
  has_many :tags, through: :taggings

  attr_accessor :bookmark, :tag_tokens

  before_save :find_or_create_site, :set_path

  def tag_tokens=(tokens)
    self.tag_ids = Tag.ids_from_tokens(tokens)
  end

  private

  def find_or_create_site
    self.site = Site.find_or_create_by!(host: site_host, protocol: site_protocol)
  end

  def set_path
    self.path = bookmark_details.path
  end

  def bookmark_details
    @bookmark_details ||= BookmarkDetails.new(bookmark)
  end

  def site_host
    bookmark_details.host
  end

  def site_protocol
    bookmark_details.protocol
  end

end
