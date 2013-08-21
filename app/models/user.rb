class User < ActiveRecord::Base

  before_save { self.email = email.downcase }
  before_create :create_remember_token

  attr_accessible :name, :login, :password, :password_confirmation, :email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :projects, dependent: :destroy
  has_many :tasks, through: :projects

  has_secure_password

  validates :name, :email, :login, presence: true
  validates :login, :email, uniqueness: {case_sensitive: false}
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates :name, length: {in: 3..15}
  validates :login, length: {in: 5..15}
  validates :password, length: {in: 6..25}

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end

end
