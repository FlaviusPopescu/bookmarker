class Tag < ActiveRecord::Base

  has_many :taggings
  has_many :bookmarks, through: :taggings

  scope :order_by_title, -> { order(:title) }

  def self.tokens(query)
    tags = where("title like ?", "%#{query}%")
    if tags.empty?
      [{id: "<<<#{query}>>>", title: "New tag: \"#{query}\""}]
    else
      tags
    end
  end

  def self.ids_from_tokens(tokens)
    tokens.gsub!(/<<<(.+?)>>>/) { create!(title: $1).id }
    tokens.split(',')
  end

end
