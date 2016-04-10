require 'terminal-table'
require 'adjective_animal'

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

  def all
    rows = []
    @items.each_with_index do |item, position|
      rows << ["#{position + 1})", "#{item.descriptions}", "#{item.details}"]
    end
    create_table(rows, @items)
  end

  def filter(item_type)
    rows = []
    filtered_items = []
    @items.each_with_index do |item, position|
      rows << ["#{position + 1})".colorize(:green), "#{item.descriptions}", "#{item.details}"] if item.type == item_type
      filtered_items << item if item.type == item_type
    end
    create_table(rows, filtered_items)
  end

  ##########################################################################
  ########################### Animal feature ###############################

  def summon_animals(animals)
    create_animals(animals)
    @animals.each do |animal|
      self.add("todo", animal.to_s)
    end
  end

  def show_animals
    @animals.each do |animal|
      puts animal
    end
  end

  def feed_animals
    @animals.each do |animal|
      dothingsfor_animal("Buy food for", animal)
      self.add("todo", "Feed #{animal}", due: "today", priority: "high")
    end
  end

  def dothingsfor_animals(action)
    @animals.each do |animal|
      dothingsfor_animal(action, animal)
    end
  end

  def animal_kingdom
    self.add("todo", "Meet party animals", due: "tomorrow", priority: "high")
    self.add("event", "Animal kingdom party", start_date: "today", end_date: "tomorrow")
  end

  ########################### Animal feature ###############################
  ##########################################################################

  ##########################################################################
  ########################## Advanced Deletion #############################

  def delete(*args)
    if args.length == 1
      index = *args
      delete_index(index)
    elsif args.length == 2
      start_index, end_index = *args
      delete_range(start_index, end_index)
    elsif args.length > 2 && args.length < @items.length
      indices = *args.each { |arg| arg }
      delete_indices(indices)
    else
      raise UdaciListErrors::ArgumentError, "Too many arguments" if args.length
    end
  end

  def delete_all
    @items.clear
  end

  ########################## Advanced Deletion #############################
  ##########################################################################

  private

  def delete_index(index)
    if index[0] > @items.size
      raise UdaciListErrors::IndexExceedsListSize, "Index Exceeds List Size "
    else
      @items.delete_at(index[0] - 1)
    end
  end

  def delete_range(start_index, end_index)
    start_index = start_index - 1
    end_index = end_index - 1
    @items.slice!(start_index..end_index)
  end

  def delete_indices(indices)
    new_array = []
    indices.each { |index| new_array.push @items.at(index - 1) }
    @items -= new_array
  end

  def dothingsfor_animal(action, animal)
    self.add("todo", "#{action} #{animal.to_s.split[1]}", due: "today", priority: "high")
  end

  def create_animals(animals)
    @@animals = []
    @animals = []
    animals.times do |animal|
      @animals << AdjectiveAnimal.new
    end
    @@animals << @animals
    @animals
  end

  def create_table(rows, item_list)
    table = Terminal::Table.new :title => @title.colorize(:blue), :headings => ['Item'.colorize(:red), 'Description'.colorize(:red), 'Details'.colorize(:red)], :rows => rows, :style => {:width => max_length(item_list) * 1.1, :alignment => :left, :padding_left => 3, :border_x => "=", :border_i => "x"}
    puts table
  end

  def max_length(item_list)
    max_description_length(item_list) + max_details_length(item_list) + 5
  end

  def max_description_length(item_list)
    max = 0
    if !item_list.empty?
      item_list.each do |item|
        max = item.descriptions.length if item.descriptions.length > max
      end
    else
      max = 20
    end
    max
  end

  def max_details_length(item_list)
    max = 0
    if !item_list.empty?
      item_list.each do |item|
        max = item.details.length if item.details.length > max
      end
    else
      max = 20
    end
    max
  end

  def make_bar(options={})
    shape = options[:shape]
    color = options[:color]
    length = options[:length]
    puts "#{shape}".colorize(color) * length
  end

  # For the original all method
  # def show_title
  #   make_bar(shape: "-", color: :green, length: @title.length)
  #   puts @title.colorize(:blue)
  #   make_bar(shape: "-", color: :green, length: @title.length)
  # end
end
