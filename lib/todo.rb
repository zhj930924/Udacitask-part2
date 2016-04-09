class TodoItem
  include Listable
  attr_reader :description, :due, :priority, :type

  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority]
    @type = 'todo'
  end

  def descriptions
    format_description(@description)
  end

  def details
    "due: ".colorize(:green) + format_date(due: @due) + format_priority(@priority)
  end
end
