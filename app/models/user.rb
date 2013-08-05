class User < ActiveRecord::Base

  before_save { self.email = email.downcase }
  attr_accessible :name, :login, :password, :password_confirmation, :email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :projects, dependent: :destroy
  has_many :tasks, through: :projects

  has_secure_password

  validates :name, :email, :login, presence: true
  validates :login, :email, uniqueness: {case_sensitive: false}
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates :name, length: {in: 3..15}
  validates :password, :login, length: {in: 6..25}

end
