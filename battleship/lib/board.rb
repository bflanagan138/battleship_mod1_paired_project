require 'pry';
class Board

  attr_accessor :cells

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
    elsif coordinates.class == String
      cells.has_key?(coordinates)
    end
  end

  def coordinate_order?(coordinates)
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
      coordinates.each_cons(2).all? do |coordinate|
       coordinate[1][1].to_i - coordinate[0][1].to_i == 1
      end
    elsif !letter_same?(coordinates)
      false
    end
  end

  def vertical?(coordinates)
    if number_same?(coordinates)
      coordinates.each_cons(2).all? do |coordinate|
        coordinate[1].ord - coordinate[0].ord == 1
      end
    elsif !number_same?(coordinates)
      false
    end
  end
  def horizontal_or_vertical?(coordinates)
     horizontal?(coordinates) || vertical?(coordinates)
  end

  # def occupied?(coordinates)
  #   if coordinates.map.all? do |coordinate|
  #     @cells[coordinate].empty? == false
  #     end
  #     true
  #   else false
  #   end
  # end

  def valid_placement?(ship, coordinates)
    #if cell has a ship already false
      coordinates.map.all? {|coordinate| @cells[coordinate].empty?} &&
      horizontal_or_vertical?(coordinates) &&
      ship.length == coordinates.length &&
      coordinate_order?(coordinates) &&
      valid_coordinate?(coordinates)
  end

#place a ship across valid cells
#cells are equal to cell coordinates
# iterate through coordinates and check if those coordinates are
# equal to a cells key. if a coordinate is equal to a key
# place ship on that coordinate
  def place(ship, coordinates)
    if valid_placement?(ship, coordinates)
     coordinates.each {|coordinate| @cells[coordinate].place_ship(ship)}
    end
   end

  def render(option = false)
    #if ship is not equal to nil
    a_row = @cells.keys.map do |cell|
      @cells[cell].render(option = false)
    end.slice(0..3)
    # binding.pry
    b_row = @cells.keys.map do |cell|
      @cells[cell].render(option = false)
    end.slice(4..7)
    c_row = @cells.keys.map do |cell|
      @cells[cell].render(option = false)
    end.slice(8..11)
    d_row = @cells.keys.map do |cell|
      @cells[cell].render(option = false)
    end.slice(12..15)
    #a_array = [" .", " .", " .", " ." ]
    string_a = "A, \n"
    string_b = "B, \n"
    string_c = "C, \n"
    string_d = "D, \n"
    "  1 2 3 4 \n" + "#{string_a.gsub(",", a_row.join)}" +
    "#{string_b.gsub(",", b_row.join)}" +
    "#{string_c.gsub(",", c_row.join)}" +
    "#{string_d.gsub(",", d_row.join)}"
  end
end
