class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  has_many :up_votes, as: :votable
  has_many :down_votes, as: :votable

  validates :user, :commentable, :body, presence: true

  scope :latest, -> { order(created_at: :desc) }
end
