class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentalbe, polymorphic: true

  validates :user, :commentable, :body, presence: true

  scope :latest, -> { order(created_at: :desc) }
end
