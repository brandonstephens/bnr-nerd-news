class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable

  validates :user, :commentable, :body, presence: true

  scope :latest, -> { order(created_at: :desc) }
end
