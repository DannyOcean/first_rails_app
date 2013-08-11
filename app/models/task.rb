class Task < ActiveRecord::Base
  after_initialize :default_values
  attr_accessible :name, :status, :project_id

  belongs_to :project

  validates_presence_of :project
  validates :name, :project_id, presence: true
  validates :name, length: {in: 2..50}

  def default_values
    self.status = false if self.status.nil?
  end
end
