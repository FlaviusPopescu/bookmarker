class BookmarkDetails

  attr_reader :bookmark, :host, :path

  def initialize(bookmark)
    @bookmark ||= bookmark
    @host = extract_host
    @path = extract_path
  end

  def protocol
    @protocol ||= bookmark.scan(/https/).first || 'http'
  end

  def extract_host
    host_and_path.shift
  end

  def extract_path
    host_and_path.join('/')
  end

  private

  def host_and_path
    @host_and_path ||= bookmark.sub("#{protocol}://", '').split('/')
  end

end
