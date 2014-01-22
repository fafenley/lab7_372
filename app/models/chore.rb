class Chore < ActiveRecord::Base
  attr_accessible :child_id, :completed, :due_on, :task_id
  belongs_to :child
  belongs_to :task 

  validates_date :due_on

  scope :by_task, joins(:task).order(:name)
  scope :chronological, order(:due_on)

  scope :past, where('due_on < ?', Date.today)
  scope :upcoming, where('due_on >=?', Date.today)
  scope :done, where(:completed => true)
  scope :pending, where(:completed => false)


  def status
  	if self.completed
  		"Completed"
  	else
  		"Pending"
  	end
  end
end
