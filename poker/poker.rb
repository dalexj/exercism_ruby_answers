class Poker
  VERSION = 1
  def initialize(hands)
    @hands = hands.map { |hand| Hand.new hand }
  end

  def best_hand
    highest_score = @hands.map(&:internal_score).max
    @hands.select { |hand| hand.internal_score == highest_score }.map(&:to_s)
  end
end

class Hand
  attr_reader :cards
  TYPES = [
    :straight_flush, :four_of_a_kind, :full_house,
    :flush, :straight, :three_of_a_kind, :two_pair, :one_pair
  ]
  def initialize(cards)
    @cards = cards.map { |card| Card.new card }
    @card_values = @cards.map(&:value).sort
    @card_values_counts = @card_values.each_with_object({}) do |value, acc|
      acc[value] ||= 0
      acc[value] += 1
    end
    @card_suits  = @cards.map(&:suit)
  end

  def to_s
    @cards.map(&:to_s)
  end

  def internal_score
    type_score = TYPES.find_index { |type| send "#{type}?" } || TYPES.length
    card_score = @card_values.sort_by { |value| [@card_values_counts[value], value] }.reverse
    [-type_score, card_score]
  end

  private

  def ace_straight?
    @card_values == [2, 3, 4, 5, 14]
  end

  def four_of_a_kind?
    @card_values_counts.values.include?(4)
  end

  def full_house?
    three_of_a_kind? && one_pair?
  end

  def straight_flush?
    straight? && flush?
  end

  def straight?
    ace_straight? || @card_values == (@card_values.first..@card_values.last).to_a
  end

  def flush?
    @card_suits.uniq.length == 1
  end

  def three_of_a_kind?
    @card_values_counts.values.include?(3)
  end

  def two_pair?
    @card_values_counts.values.sort == [1,2,2]
  end

  def one_pair?
    @card_values_counts.values.include?(2)
  end
end

class Card
  attr_reader :value, :suit, :to_s
  def initialize(card)
    @to_s = card
    @value, @suit = card.chars
    @value = {"A" => 14, "J" => 11, "Q" => 12, "K" => 13}[@value] || @value.to_i
  end

  def inspect
    "<Card #{@to_s} value=#{@value} suit=#{@suit.inspect}>"
  end
end
