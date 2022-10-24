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

  #  def fire_upon
  #     if empty? == false && @fired_upon == false
  #       ship.hit
  #       @fired_upon = true
  #     else empty? == true
  #       ' M'
  #       @fired_upon
  #     end
  #  end

def render(option = false)
  if empty? == false && ship.health == 0
    ' X'
  elsif  @fired_upon == true && empty? == false && ship.sunk? == false
    ' H'
  elsif   @fired_upon == true && empty? == true
    ' M'
  elsif option == true && empty? == false
    ' S'
  else
    ' .'
  end
end

end
