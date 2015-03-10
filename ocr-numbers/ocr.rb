class OCR
  NUM_CONVERTER = { " _ \n| |\n|_|" => "0"}
  def initialize(text)
    @text = text
  end

  def convert
    rows_of_numbers.map do |row_of_numbers|
      amount_of_numbers = row_of_numbers.map(&:length).max / 3
      amount_of_numbers.times.map do |n|
        number_ocr = row_of_numbers.map { |r| r[n, 3].ljust(3, " ") }.join
        puts number_ocr
        NUM_CONVERTER.fetch number_ocr, "?"
      end
    end.join(",")
  end

  def rows_of_numbers
    @text.split("\n").each_slice(4).map { |s| s.reject(&:empty?) }
  end
end
