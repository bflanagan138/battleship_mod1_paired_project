class Cell
  attr_reader :coordinate,
              :ship,
              :fired_upon
  attr_accessor :render_cell            
  
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
    @fired_upon = false
    @render_cell = "."
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
  if option == false && @fired_upon == true && empty? == true
    @render_cell = 'M'
  elsif option == false && @fired_upon == false
    @render_cell
  elsif option == false && @fired_upon == true && @ship.sunk? == false
    @render_cell = 'H'
  elsif @ship.sunk?
    @render_cell = 'X'
  else option == true && empty? == false
    @render_cell = 'S'
  end
end

end
