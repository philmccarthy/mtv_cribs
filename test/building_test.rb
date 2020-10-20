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

  def test_it_can_add_units
    building = Building.new
    unit1 = Apartment.new(
                            {
                              number: "A1",
                              monthly_rent: 1200,
                              bathrooms: 1,
                              bedrooms: 1
                            }
                         )
    unit2 = Apartment.new(
                            {
                              number: "B2",
                              monthly_rent: 999,
                              bathrooms: 2,
                              bedrooms: 2
                            }
                          )
    building.add_unit(unit1)
    building.add_unit(unit2)
    assert_equal [unit1, unit2], building.units
    assert_equal [], building.renters
  end
end
