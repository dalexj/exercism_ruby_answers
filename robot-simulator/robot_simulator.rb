class Robot
  DIRECTIONS = [:north, :east, :south, :west]
  MOVE_AMOUNTS = { north: [0, 1], east: [1, 0], south: [0, -1], west: [-1, 0] }

  attr_reader :bearing, :coordinates

  def orient(direction)
    raise ArgumentError unless DIRECTIONS.include? direction
    @bearing = direction
  end

  def turn_right
    turn(-1)
  end

  def turn_left
    turn(1)
  end

  def at(x, y)
    @coordinates = [x, y]
  end

  def advance
    @coordinates = coordinates.zip(MOVE_AMOUNTS[bearing]).map { |to_add| to_add.reduce(0, :+) }
  end

  private

  def turn(rotate_amt)
    @bearing = DIRECTIONS[DIRECTIONS.rotate(rotate_amt).index(bearing)]
  end
end

class Simulator
  INSTRUCTIONS_CONVERTER = {"L" => :turn_left, "R" => :turn_right, "A" => :advance}

  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, raw_instructions)
    instructions(raw_instructions).each { |command| robot.__send__ command }
  end

  def instructions(raw_instructions)
    raw_instructions.chars.map { |instruction| INSTRUCTIONS_CONVERTER[instruction] }
  end
end
