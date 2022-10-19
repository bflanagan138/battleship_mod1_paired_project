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
#if empty and not fired upon '.'
#if empty and fired upon 'M'
#if not empty and not fired upon 'S'
#if not empty and fired upon 'H'
#if fired upon and ship sunk 'X'
def render(option = false)
# require 'pry'; binding.pry
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
    #require 'pry'; binding.pry
  end
end

end
