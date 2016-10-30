class User < ActiveRecord::Base
  has_secure_password
  validates :username, :email, :password, presence: true
  validates :email, uniqueness: true
  has_many :gifs, through: :favorite
  has_many :favorites
  has_many :favorites, dependent: :delete_all

  enum role: %w(default admin)
end
