class TwoBucket
  VERSION = 1
  attr_reader :goal_bucket, :other_bucket
  def initialize(bucket, other_bucket, goal, goal_bucket)
    @bucket = bucket
    @other_bucket = other_bucket
    @goal = goal
    @goal_bucket = goal_bucket
  end

  def moves
    possibilities = [Possibility.new(@bucket, @other_bucket)]
    loop do
      possibilities = possibilities.flat_map(&:take_steps)
      correct = possibilities.find { |poss| poss.check?(@goal, @goal_bucket) }
      return correct.moves.length if correct
    end
  end
end

class Possibility
  attr_accessor :moves
  def initialize(bucket1_max, bucket2_max, bucket1=0, bucket2=0, moves=[], history=[])
    @bucket1_max = bucket1_max
    @bucket2_max = bucket2_max
    @bucket1 = bucket1
    @bucket2 = bucket2
    @history = history
    @history << export
    @moves = moves
  end

  def ==(other)
    export == other.export
  end

  def export
    {
      bucket1_max: @bucket1_max,
      bucket2_max: @bucket2_max,
      bucket1: @bucket1,
      bucket2: @bucket2,
    }
  end

  def copy
    Possibility.new(@bucket1_max, @bucket2_max, @bucket1, @bucket2, @moves.dup, @history.dup)
  end

  def possible_moves
    [:fill_1, :fill_2, :move_1_to_2, :move_2_to_1, :empty_1, :empty_2]
  end

  def already_seen?
    @history.include? export
  end

  def take_steps
    possible_moves.map do |move|
      possibility = copy
      possibility.send move
      possibility.moves << move

      possibility.already_seen? ? nil : possibility
    end.compact
  end

  def check?(goal, goal_bucket)
    { "one" => @bucket1, "two" => @bucket2 }[goal_bucket] == goal
  end

  def fill_1
    @bucket1 = @bucket1_max
  end

  def fill_2
    @bucket2 = @bucket2_max
  end

  def move_1_to_2
    available = @bucket2_max - @bucket2
    if @bucket1 > available
      @bucket2 = @bucket2_max
      @bucket1 -= available
    else
      @bucket2 += @bucket1
      @bucket1 = 0
    end
  end

  def move_2_to_1
    available = @bucket1_max - @bucket1
    if @bucket2 > available
      @bucket1 = @bucket1_max
      @bucket2 -= available
    else
      @bucket1 += @bucket2
      @bucket2 = 0
    end
  end

  def empty_1
    @bucket1 = 0
  end

  def empty_2
    @bucket2 = 0
  end
end
