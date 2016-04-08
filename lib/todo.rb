class TodoItem
  include Listable
  attr_reader :description, :due, :priority

  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority]
  end

  def format_date
    @due ? @due.strftime("%D") : "No due date"
  end

  def details
    format_description(@description) + "due: " +
    format_date +
    format_priority(@priority)
  end
end
