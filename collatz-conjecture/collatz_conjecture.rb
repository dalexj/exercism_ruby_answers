class CollatzConjecture
  def self.steps(num, steps_so_far = 0)
    raise ArgumentError if num <= 0
    return steps_so_far if num == 1

    if num.odd?
      steps(3 * num + 1, steps_so_far + 1)
    else
      steps(num / 2, steps_so_far + 1)
    end
  end
end


class BookKeeping
  VERSION = 1
end
