class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :up_votes
  has_many :down_votes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
