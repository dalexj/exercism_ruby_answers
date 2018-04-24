class Game
  VERSION = 1

  attr_reader :score

  def initialize
    @frames = []
  end

  def roll(pins)
    raise RuntimeError if game_over?
    if pins.is_a? Array
      @frames << Frame.new(pins, @frames.length + 1)
    else
      if @frames.last && !@frames.last.full?
        @frames.last << pins
      else
        @frames << Frame.new([pins], @frames.length + 1)
      end
    end
  end

  def score
    raise RuntimeError if !game_over?
    @frames.each_with_index.reduce(0) do |acc, (frame, index)|
      acc + frame.score(@frames[index + 1], @frames[index + 2])
    end
  end

  private

  def game_over?
    length = @frames.length
    tenth = @frames[9]
    [
      length == 10 && tenth.raw_score != 10 && tenth.full?,
      length == 11 && tenth.strike? && @frames[10].full? && @frames[10].raw_score != 10,
      length == 11 && tenth.spare? && !@frames[10].full?,
      length == 12 && tenth.strike? && @frames[10].raw_score == 10 && @frames[11].full?,
    ].any?
  end
end

class Frame
  attr_reader :pins
  def initialize(pins, frame_num)
    @pins = pins
    @frame_num = frame_num
    validate!
  end

  def <<(pin)
    @pins << pin
    validate!
  end

  def full?
    strike? || @pins.length == 2
  end

  def score(next_frame, frame_after_that)
    return 0 if @frame_num > 10
    if @pins == [10]
      10 + [next_frame&.pins, frame_after_that&.pins].flatten[0..1].reduce(0, :+)
    elsif raw_score == 10
      10 + next_frame.pins.first
    else
      raw_score
    end
  end

  def strike?
    @pins == [10]
  end

  def spare?
    @pins.length == 2 && raw_score == 10
  end

  def raw_score
    @pins.reduce(0, :+)
  end

  private

  def validate!
    raise RuntimeError if raw_score > 10 || raw_score < 0
  end
end
