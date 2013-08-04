class Task < ActiveRecord::Base

  attr_accessible :name, :status, :project_id

  belongs_to :project

  validates_presence_of :project
  validates :name, :project_id, presence: true
  validates :name, length: {maximum: 20}
end
