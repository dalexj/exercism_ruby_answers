class Scale

  SCALES = {
    chromatic: %w[A A# B C C# D D# E F F# G G#]
  }

  def initialize(starting_note, pattern, steps = "mmmmmmmmmmmm")
    @starting_note = starting_note.capitalize
    @pattern = pattern
    @rotated_pattern = SCALES[:chromatic].rotate(SCALES[:chromatic].index(@starting_note))
    @steps = steps
  end

  def name
    "#{@starting_note} #{@pattern}"
  end

  def pitches
    scale = select_scale_from_steps
    ["F"].include?(@starting_note) ? change_to_flats(scale) : scale
    # scale.join.size > 10 ? change_to_flats(scale) : scale
  end

  private

  def select_scale_from_steps
    scale = []
    index = 0
    @steps.each_char do |step|
      scale << @rotated_pattern[index]
      index += { "M" => 2, "m" => 1 }[step]
    end
    scale
  end

  def change_to_flats(scale)
    scale.map { |note| note_to_flat(note) }
  end

  def note_to_flat(note)
    note.gsub(/[A-G]\#/) { |match| match[0].ord.next.chr + "b" }.gsub("H", "A")
  end
end
