class Cell
  attr_reader :coordinate,
              :ship,
              :fired_upon?

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
    @fired_upon? = false
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end
# place ship will change empty? from true to false
  def place_ship(place)
    # require 'pry'; binding.pry
    if empty? == true
      @ship = place
    end
  end

end
