class Property

  attr_reader :area, :street_name, :value, :charge
  attr_accessor :owner

  def initialize(options)
    @street_name = options[:street_name]
    @value =  options[:value]
    @charge = options[:charge]
    @area = options[:area]
    @owner =  options[:owner]
  end

  def property(position)
    @properties[position]
  end  



end