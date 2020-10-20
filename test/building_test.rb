require 'minitest/autorun'
require 'minitest/pride'
require './lib/building'
require './lib/renter'
require './lib/apartment'

class BuildingTest < Minitest::Test
  def test_it_exists_and_has_attributes
    building = Building.new
    assert_equal [], building.units
  end
end
