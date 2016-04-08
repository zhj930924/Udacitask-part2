class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title] || "Untitled List"
    @items = []
  end

  def add(type, description, options={})
    type = type.downcase
    case type
    when "todo"
      @items.push TodoItem.new(description, options)
    when "event"
      @items.push EventItem.new(description, options)
    when "link"
      @items.push LinkItem.new(description, options)
    else
      raise UdaciListErrors::InvalidItemType, "Invalid Item Type"
    end
  end

  def delete(index)
    if index > @items.size
      raise UdaciListErrors::IndexExceedsListSize, "Index Exceeds List Size "
    else
      @items.delete_at(index - 1)
    end
  end

  def all
    make_bar(shape: "-", color: :green, length: @title.length)
    puts @title.colorize(:blue)
    make_bar(shape: "-", color: :green, length: @title.length)
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end

  private

  def make_bar(options={})
    shape = options[:shape]
    color = options[:color]
    length = options[:length]
    puts "#{shape}".colorize(color) * length
  end
end
