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
   def render(*bool)
      if @fired_upon == true && empty? == false && ship.health == 0
        'X'
      elsif @fired_upon == true && empty? == false
        'H'
      elsif @fired_upon == true && empty? == true
        'M'
      elsif @fired_upon == false && empty? == false && (bool)
        'S'
      else
        '.'
      end
   end


end
