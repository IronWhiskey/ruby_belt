class Post < ActiveRecord::Base
  belongs_to :user

  validates :idea, presence: true
  has_many :user_posts
  has_many :users, through: :user_posts
  
end
