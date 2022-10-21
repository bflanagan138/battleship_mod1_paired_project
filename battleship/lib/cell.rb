class Cell
  attr_reader :coordinate,
              :ship,
              :fired_upon


  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
    @fired_upon = false
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end

  def place_ship(place)
    if empty? == true
      @ship = place
    end
  end

   def fired_upon?
     @fired_upon
   end


   def fire_upon
      @fired_upon = true
      if empty? == false
        ship.hit
      end
   end

def render(option = false)
  if option == false && @fired_upon == true && empty? == true
    'M'
  elsif option == false && @fired_upon == false
    '.'
  elsif option == false && @fired_upon == true && @ship.sunk? == false
    'H'
  elsif @ship.sunk?
    'X'
  else option == true && empty? == false
    'S'
  end
end

end
