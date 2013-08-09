class Project < ActiveRecord::Base

  attr_accessible :name, :user_id

  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates_presence_of :user
  validates :name, :user_id, presence: true
  validates :name, length: {in: 3..50}
end
