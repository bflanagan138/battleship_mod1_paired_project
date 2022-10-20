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

  def valid_coordinate?(coordinates)
    if coordinates.class == Array
        coordinates.map.all? {|coord| cells.has_key?(coord)}
      #require 'pry'; binding.pry
        #coord.each { |coordinate| cells.has_key?(coordinate) }
    elsif coordinates.class == String
      cells.has_key?(coordinates)
    end
  end

  def coordinate_order?(coordinates) #comeback dont think needed ????
  #  ship.length == coordinates.length
    valid_l = coordinates.sort {|a, b| a <=> b}
    valid_l == coordinates
  end

  def letter_same?(coordinates)
    letters = coordinates.map { |coordinate| coordinate[0] }
    letters.uniq.length == 1
  end

  def number_same?(coordinates)
    numbers = coordinates.map {|coordinate| coordinate[1]}
    numbers.uniq.length == 1
  end

  def horizontal?(coordinates)
    if letter_same?(coordinates)
      # binding.pry
      coordinates.each_cons(2).all? do |coordinate|
       coordinate[1][1].to_i - coordinate[0][1].to_i == 1
      end
    elsif !letter_same?(coordinates)
      false
    end
  end

  def vertical?(coordinates)
    if number_same?(coordinates)
      # binding.pry
      coordinates.each_cons(2).all? do |coordinate|
        coordinate[1].ord - coordinate[0].ord == 1
      end
    elsif !number_same?(coordinates)
      false
    end
  end
  def horizontal_or_vertical?(coordinates)
    #binding.pry
     horizontal?(coordinates) || vertical?(coordinates)
  end
  #   if letter_same?(coordinates)
  #   coordinates.each_cons(2).all? {|coordinate| coordinate[1][1].to_i - coordinate[0][1].to_i == 1 }
  #     true
  #   elsif number_same?(coordinates)
  #     coordinates.each_cons(2).all? {|coordinate| coordinate[1].ord - coordinate[0].ord == 1 }
  #   else
  #     false
  #   end
  # end

  def valid_placement?(ship, coordinates)
    horizontal_or_vertical?(coordinates) && ship.length == coordinates.length && coordinate_order?(coordinates) && valid_coordinate?(coordinates)
   #require 'pry'; binding.pry
 end
end
