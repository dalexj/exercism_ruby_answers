class Triangle
  def initialize(size)
    @size = size
  end

  def rows
    (2..@size).each_with_object([[1]]) do |row_num, rows|
      rows << calculate_row(rows.last)
    end
  end

  private

  def calculate_row(prev_row)
    [1] + prev_row.each_cons(2).map { |a, b| a + b } + [1]
  end
end
