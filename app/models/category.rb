require "babosa"
class Category < ActiveRecord::Base
  attr_accessible :title
  has_many :posts

  validates :title, :presence => true

extend FriendlyId
  friendly_id :title, use: :slugged


  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end
end
