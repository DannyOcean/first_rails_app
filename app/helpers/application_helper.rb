module ApplicationHelper

  def insert_html(s)
    s.html_safe
  end

  def remaining_to_date(date)
    unless date.nil?
      remaining_time = (date - Time.now).round
      remaining_time = (remaining_time / 60 / 60 ) #hours
      "#{remaining_time} hours remaining"
    else
      "Deadline isn't set"
    end
  end

end
