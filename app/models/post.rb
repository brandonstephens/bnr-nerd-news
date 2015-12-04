class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable

  scope :latest, -> { order(created_at: :desc) }
end
