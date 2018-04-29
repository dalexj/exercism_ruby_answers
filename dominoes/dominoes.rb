class Dominoes
  def self.chain(input_dominoes)
    return [] if input_dominoes == []
    available_dominoes = input_dominoes.dup
    counts = count_numbers(available_dominoes)

    if counts.any? { |num, amount| amount % 2 == 1 }
      # matching an odd number of domino numbers
      # is already impossible
      return nil
    end

    make_chain([available_dominoes.first], available_dominoes[1..-1])
  end

  def self.make_chain(chain, available_dominoes)
    if available_dominoes == []
      return chain if chain.first.first == chain.last.last
      return nil
    end

    number_to_match = chain.last.last
    possible_domino_indexes = available_dominoes.each_with_object([]).with_index do |(domino, indexes), index|
      indexes << index if domino.member?(number_to_match)
    end

    possible_domino_indexes.each do |index|
      domino = available_dominoes.at(index)
      domino = domino.reverse if domino.last == number_to_match

      new_chain = make_chain(chain + [domino], available_dominoes.reject.with_index { |_, i| i == index })
      return new_chain if new_chain
    end

    nil
  end

  def self.count_numbers(dominoes)
    dominoes.flatten.each_with_object({}) do |number, totals|
      totals[number] ||= 0
      totals[number] += 1
    end
  end
end

class BookKeeping
  VERSION = 1
end
