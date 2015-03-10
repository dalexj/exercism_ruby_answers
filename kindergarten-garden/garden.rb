class Garden
  PLANTS_CONVERSION = { "V" => :violets, "C" => :clover, "R" => :radishes, "G" => :grass }
  DEFAULT_STUDENTS = [:alice, :bob, :charlie, :david,
                      :eve, :fred, :ginny, :harriet,
                      :ileana, :joseph, :kincaid, :larry]
  def initialize(plants, students = DEFAULT_STUDENTS)
    @plants = plants
    students.sort.map(&:downcase).each_with_index do |person, index|
      define_singleton_method person do
        find_plants(index)
      end
    end
  end

  def find_plants(index)
    letters = @plants.split("\n").map { |row| row[index * 2, 2] }.join
    letters.chars.map { |letter| PLANTS_CONVERSION[letter] }
  end
end
