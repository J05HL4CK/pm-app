class Task < ApplicationRecord
  belongs_to :project
  validates :status, inclusion: { in: %w[to-do in-progress complete] }
  STATUS_OPTIONS = [
    ['To do', 'to-do'],
    ['In progress', 'in-progress'],
    ['Complete', 'complete']
  ]
  def badge_status 
    case status
    when 'to-do'
      'danger'
    when 'in-progress'
      'info'
    when 'complete'
      'success'
    else
      'secondary'
    end
  end

  def complete?
    status == 'complete'
  end

  def in_progress?
    status == 'in-progress'
  end

  def to_do?
    status == 'to-do'
  end

end
