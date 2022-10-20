require 'pry';
class Board

  attr_reader :cells

  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4"),
    }
  end

  def valid_coordinate?(coord)
    cells.has_key?(coord)
  end

  def coordinate_order?(coordinates) #comeback
  #  ship.length == coordinates.length 
    valid_l = coordinates.sort {|a, b| a <=> b}
    valid_l == coordinates
  end

  def lateral_placement?(coordinates)

    if coordinates.all? {|coordinate| coordinate[0] } &&
       coordinates.each_cons(2).all? {|coordinate| coordinate[1][1].to_i - coordinate[0][1].to_i == 1 }
       true
     else
       false
     end

  end

  def valid_placement?(ship, coordinates)
    #binding.pry
  end
end