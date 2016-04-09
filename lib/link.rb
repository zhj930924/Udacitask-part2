class LinkItem
  include Listable
  attr_reader :description, :site_name, :type

  def initialize(url, options={})
    @description = url
    @site_name = options[:site_name]
    @type = 'link'
  end

  def format_name
    @site_name ? @site_name : ""
  end

  def descriptions
    format_description(@description)
  end

  def details
    "site name: ".colorize(:green) + format_name
  end
end
