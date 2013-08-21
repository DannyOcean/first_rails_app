class Task < ActiveRecord::Base

  after_initialize :default_values
  attr_accessible :name, :status, :project_id

  belongs_to :project

  validates_presence_of :project
  validates :name, :project_id, presence: true
  validates :name, length: {in: 2..50}
  validates :priority, :inclusion =>  1..3, numericality: {only_integer: true}

  def default_values
    self.status = false if self.status.nil?
    self.priority = 1 if self.priority.nil?
  end

=begin
  def deadline=(val)
    write_attribute :deadline, val.to_datetime
  end

  def priority=(val)
    write_attribute :priority, val.to_s.gsub(/\D/, '').to_i
  end
=end
end
