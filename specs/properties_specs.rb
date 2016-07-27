require 'minitest/autorun'
require 'minitest/rg'
require 'pry-byebug'
require_relative('../properties.rb')
require_relative('../game.rb')

class PropertiesTest < MiniTest::Test

  def setup

    @property = Property.new({area: "Leith", street_name: "Leith Walk", value: 40, charge: 10, owned: "no"})

    # [
    #   {area: "Leith", street_name: "Leith Walk", position: 2, value: 40, charge: 10, owned: "no"},
    #   {area: "Leith", street_name: "Lorne St", position: 3, value: 40, charge: 10, owned: "no"},
    #   {area: "Haymarket", street_name: "Haymarket Terrace", position: 5, value: 45, charge: 15, owned: "no"}]
  end



end