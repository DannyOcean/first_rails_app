module ApplicationHelper

  def insert_html(s)
    s.html_safe
  end

  def remaining_to_date(date)
    if date.nil?
      "DEADLINE isn't set"
    else
      remaining_time = (date - Time.now).round
      remaining_time = (remaining_time / 60 / 60 ) #hours
      if remaining_time > 0
        "#{remaining_time} hours remaining"
      else
        "DEADLINE has gone"
      end
    end
  end

end
