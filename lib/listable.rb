module Listable

  def format_description(description)
    number = 45
    string = "#{description}".ljust(31)
    if string.split[0].to_s[/[A-Z]\w+/].to_s.length > 0
      string = string.split[0].to_s[/[A-Z]\w+/].to_s.colorize(:blue) + ' ' + string.split[1..-1].join(' ')
      string.ljust(number)
    else
      string.ljust(number - 14)
    end
  end

  # def format_date(date)
  #   case date
  #   when date.size == 1
  #     date[0] ? date[0].strftime("%D") : "No due date"
  #   when date.size == 2
  #     dates = date[0].strftime("%D") if date[0]
  #     dates << " -- " + date[1].strftime("%D") if date[1]
  #     dates = "N/A" if !dates
  #     return dates
  #   else
  #     puts 'Invalid dates'
  #   end
  # end

  # def format_date(options={})
  #   when date.size == 1
  #     date[0] ? date[0].strftime("%D") : "No due date"
  #   when date.size == 2
  #     dates = date[0].strftime("%D") if date[0]
  #     dates << " -- " + date[1].strftime("%D") if date[1]
  #     dates = "N/A" if !dates
  #     return dates
  #   else
  #     puts 'Invalid dates'
  #   end
  # end

  def format_priority(priority)
    if priority == "high"
      value = " ⇧"
    elsif priority == "medium"
      value = " ⇨"
    elsif priority == "low"
      value = " ⇩"
    elsif !priority
      value = ""
    else
      raise UdaciListErrors::InvalidPriorityValue, "Invalid Priority Value"
    end
    return value
  end

end
