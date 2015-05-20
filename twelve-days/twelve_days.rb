class TwelveDaysSong
  THINGS_GIVEN = {
    1 => "a Partridge in a Pear Tree", 2 => "two Turtle Doves", 3 => "three French Hens",
    4 => "four Calling Birds", 5 => "five Gold Rings", 6 => "six Geese-a-Laying",
    7 => "seven Swans-a-Swimming", 8 => "eight Maids-a-Milking", 9 => "nine Ladies Dancing",
    10 => "ten Lords-a-Leaping", 11 => "eleven Pipers Piping", 12 => "twelve Drummers Drumming",
  }

  NTH = {
    1 => "first", 2 => "second", 3 => "third",
    4 => "fourth", 5 => "fifth", 6 => "sixth",
    7 => "seventh", 8 => "eighth", 9 => "ninth",
    10 => "tenth", 11 => "eleventh", 12 => "twelfth",
  }

  def verse(number)
    things = (1..number).reverse_each.map { |day| THINGS_GIVEN[day] }.join(", ").gsub("Doves, a", "Doves, and a")
    "On the #{NTH[number]} day of Christmas my true love gave to me, #{things}.\n"
  end

  def verses(from, to)
    (from..to).map { |num| verse(num) }.join("\n") + "\n"
  end

  def sing
    verses(1, 12)
  end
end
