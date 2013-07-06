class Tag < ActiveRecord::Base

  has_many :taggings
  has_many :bookmarks, through: :taggings

  scope :order_by_title, -> { order(:title) }
  scope :where_title_like, -> (query) { where("title like ?", "%#{query}%") }

  def self.tokens(query)
    tags = where_title_like(query)

    if tags.map(&:title).include?(query)
      tags
    else
      tags.unshift({id: "<<<#{query}>>>", title: "New: \"#{query}\""})
    end
  end

  def self.ids_from_tokens(tokens)
    tokens.gsub!(/<<<(.+?)>>>/) { create!(title: $1).id }
    tokens.split(',')
  end

end
