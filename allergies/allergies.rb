class Allergies
  ORDERED_ALLERGIES = %w[cats pollen chocolate tomatoes strawberries shellfish peanuts eggs]

  def initialize(score)
    @score = score % (2**ORDERED_ALLERGIES.length)
  end

  def list
    ORDERED_ALLERGIES.select.with_index do |allergy, index|
      binary_score[index] == "1"
    end.reverse
  end

  def binary_score
    @score.to_s(2).rjust(ORDERED_ALLERGIES.length, "0")
  end

  def allergic_to?(food)
    list.include? food
  end
end
