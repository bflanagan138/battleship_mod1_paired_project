class Cell

  attr_reader :coordinate,
              :ship,
              :fired_upon
   attr_accessor #:render

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
    @fired_upon = false
    #@render = " ."
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
  # require 'pry'; binding.pry
  if empty? == false && ship.health == 0
    ' X'
  elsif option == false && @fired_upon == true && empty? == false && ship.sunk? == false
    #@render =
    ' H'
  elsif  option == false && @fired_upon == true && empty? == true
    #@render =
    ' M'
  elsif option == true && empty? == false
    #@render =
    ' S'
  else
    ' .'
  end
end

end
