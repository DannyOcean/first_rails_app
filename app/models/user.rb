class User < ActiveRecord::Base

  attr_accessible :name, :login, :password, :password_confirmation, :email

  has_many :projects, dependent: :destroy
  has_many :tasks, through: :projects

  validates :password, confirmation: true
  validates :password_confirmation, :name, :login, :email, presence: true
  validates :login, :email, uniqueness: {case_sensitive: false}
  validates :password, :login, length: {in: 6..20}
  validates :name, length: {in: 3..15}
end
