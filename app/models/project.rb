class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy

  def badge_status
    return 'badge bg-success' if tasks.all?(&:complete?) && tasks.length.positive?
    return 'badge bg-info' if tasks.any?(&:in_progress?)
    return 'badge bg-danger' if tasks.any?(&:to_do?)
    return 'badge bg-danger' if tasks.nil?
  end

  def status
    return 'complete' if tasks.all?(&:complete?) && tasks.length > 0
    return 'in-progress' if tasks.any?(&:in_progress?)
    return 'to-do' if tasks.any?(&:to_do?)
    
  end

  def total_tasks
    tasks.count
  end

  def total_complete
    tasks.select(&:complete?).count
  end

  def percentage_complete
    if tasks.none? 
      0
    else 
      ((total_complete.to_f / total_tasks) * 100).round
    end
  end
end
