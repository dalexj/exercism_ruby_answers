class Board
  def initialize(board_representation)
    @cells = board_representation.map { |row| row.split(" ") }
  end

  def winner
    x_starting_locations = (0...height).map { |n| [0, n] }
    x_connections = x_starting_locations.map { |loc| all_connected_coordinates(loc, "X") }.flatten(1)
    return "X" if x_connections.any? { |x, y| x == width - 1 }

    o_starting_locations = (0...width).map { |n| [n, 0] }
    o_connections = o_starting_locations.map { |loc| all_connected_coordinates(loc, "O") }.flatten(1)
    return "O" if o_connections.any? { |x, y| y == height - 1 }

    return ""
  end

  private

  def piece_at(coordinates)
    x, y = coordinates
    @cells[y][x]
  end

  def all_connected_coordinates(starting_coordinates, piece)
    connected_coordinates = []
    queue = [starting_coordinates]

    while queue.any?
      coord = queue.shift
      next if connected_coordinates.member?(coord)
      if piece_at(coord) == piece
        connected_coordinates << coord
        queue.concat(coordinates_next_to(coord))
      end
    end

    connected_coordinates
  end

  def coordinates_next_to(coordinates)
    directions.map do |x, y|
      [
        x + coordinates[0],
        y + coordinates[1],
      ]
    end.reject { |x, y| [x < 0, y < 0, x >= width, y >= height].any? }
  end

  def height
    @cells.length
  end

  def width
    @cells[0].length
  end

  def directions
    # . . . . .
    #  . . O O .
    #   . O $ O .
    #    . O O . .
    #     . . . . .
    [
      [0, -1],
      [1, -1],
      [-1, 0],
      [1, 0],
      [-1, 1],
      [0, 1],
    ]
  end
end

class BookKeeping
  VERSION = 2
end
