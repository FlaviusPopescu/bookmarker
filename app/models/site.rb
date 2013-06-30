class Site < ActiveRecord::Base

  validates :host, uniqueness: true

  has_many :bookmarks

end
