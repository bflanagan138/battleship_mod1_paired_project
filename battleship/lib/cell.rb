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
# place ship will change empty? from true to false
  def place_ship(place)
    # require 'pry'; binding.pry
    if empty? == true
      @ship = place
    end
  end

   def fired_upon?
     @fired_upon
   end


   def fire_upon
     if empty? == false
       @fired_upon = true
       ship.hit
     end
   end
#if empty and not fired upon '.'
#if empty and fired upon 'M'
#if not empty and not fired upon 'S'
#if not empty and fired upon 'H'
#if fired upon and ship sunk 'X'
   def render
     require 'pry'; binding.pry
     if empty? == true && @fired_upon == false
       '.'
     elsif empty? == true && @fired_upon == true
       'M'
     elsif empty? == false && @fired_upon == false
       'S'

     end
   end


end
