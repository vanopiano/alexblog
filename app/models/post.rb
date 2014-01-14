require "babosa"

class Post < ActiveRecord::Base
  attr_accessible :body, :title, :author, :user_id, :category_id

  acts_as_commentable
  belongs_to :user
  belongs_to :category

  validates :title, presence: true
  validates :body, presence: true


  extend FriendlyId
  friendly_id :title, use: :slugged


  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize(transliterations: :russian).to_s
  end

end
