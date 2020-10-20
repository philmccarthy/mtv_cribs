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
end
