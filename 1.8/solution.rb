module Cubert
  class << self
    def calc(number)
      iter_calc(number, 1)
    end

    def iter_calc(number, guess)
      good_enough?(number, guess) ? guess : iter_calc(number, improve(number, guess))
    end

    def good_enough?(number, guess)
      (number - guess * guess * guess).abs < 0.00001 * number
    end

    def improve(number, guess)
      (number / (guess * guess) + 2 * guess) / 3.0
    end
  end
end

puts "27 => #{Cubert.calc(27)}"
puts "8 => #{Cubert.calc(8)}"
puts "64 => #{Cubert.calc(64)}"
puts "125 => #{Cubert.calc(125)}"
puts "200 => #{Cubert.calc(200)}"
puts "0.000001 => #{Cubert.calc(0.000001)}"