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

  def test_it_can_produce_array_of_renter_names
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
    renter1 = Renter.new("Aurora")
    unit1.add_renter(renter1)
    assert_equal ["Aurora"], building.renters
    renter2 = Renter.new("Tim")
    unit2.add_renter(renter2)
    assert_equal ["Aurora", "Tim"], building.renters
  end

  def test_it_can_report_average_rent
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
    assert_equal 1099.5, building.average_rent
  end
end
