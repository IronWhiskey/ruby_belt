class User < ActiveRecord::Base
  has_secure_password

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  has_many :user_posts
  has_many :posts, through: :user_posts
  
  validates :name, :alias, presence: true
  validates :email, presence: true,  uniqueness: {case_sensitive: false}, format: { with: EMAIL_REGEX }
  validates :password, length: { minimum: 8 }
  before_create do |user|
    user.email = user.email.downcase
  end

end
