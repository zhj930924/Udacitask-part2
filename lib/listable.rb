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

  def format_date(options = {})
    if options[:start_date] && options[:end_date]
      dates = options[:start_date].strftime("%D") if options[:start_date]
      dates << " -- " + options[:end_date].strftime("%D") if options[:end_date]
      dates = "N/A" if !dates
      return dates
    else
      options[:due] ? options[:due].strftime("%D") : "No due date"
    end
  end

  def format_priority(priority)
    case priority
    when "high"
      value = " ⇧".colorize(:red)
    when "medium"
      value = " ⇨".colorize(:yellow)
    when "low"
      value = " ⇩".colorize(:green)
    else
      value = ""
    end
    return value
  end

end
