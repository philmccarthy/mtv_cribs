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
end
