class Building
  attr_reader :units
  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def renters
    @renters = []
      @units.each do |unit|
        if unit.renter != nil
          @renters << unit.renter.name
        end
      end
    @renters
  end

  def total_rent
    @units.sum {|unit| unit.monthly_rent}
  end

  def average_rent
    total_rent.to_f / @units.size
  end

  def rented_units
    @units.select do |unit|
      if unit.renter != nil
        unit
      end
    end
  end

  def renter_with_highest_rent
    rented_units.max_by do |unit|
      unit.monthly_rent
    end.renter
  end

  def units_by_number_of_bedrooms
    units_by_bedroom =  @units.group_by do |unit|
                          unit.bedrooms
    end
    units_by_bedroom.each_pair do |bedrooms, units|
      units.map! do |unit|
        unit.number
      end
    end
  end

  def annual_breakdown
    rented =  rented_units.group_by do |unit|
                      unit.renter.name
                    end
    breakdown = rented.each_pair do |renter, unit|
                  unit.map! do |unit|
                    unit.monthly_rent * 12
                  end
                end
    breakdown.transform_values do |value|
      value.to_s.delete('[]').to_i
    end
  end
end
