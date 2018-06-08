class Change
  def self.generate(coins, total_amount_to_match)
    return [] if total_amount_to_match == 0
    return -1 if total_amount_to_match < 0

    test_possibilities(coins, total_amount_to_match, [[0] * coins.length])
  end

  def self.test_possibilities(coins, total_amount_to_match, possibilities)
    next_possibilities = possibilities.map { |poss| get_next_possibilities(poss) }.flatten(1).uniq
    answer = next_possibilities.find do |possibility|
      possibility.map.with_index { |num, index| num * coins[index] }.reduce(:+) == total_amount_to_match
    end
    if answer
      answer.map.with_index { |amt, index| [coins[index]] * amt }.flatten
    else
      if next_possibilities.first.reduce(:+) * coins.first > total_amount_to_match
        return -1
      end
      test_possibilities(coins, total_amount_to_match, next_possibilities)
    end
  end

  def self.get_next_possibilities(amounts)
    (0...amounts.length).map do |index|
      amounts.dup.tap { |possibility| possibility[index] += 1 }
    end
  end
end

class BookKeeping
  VERSION = 2
end
