module Power
  class << self
    def calc(number, power)
      calc_iter(number, power, 1)
    end

    def calc_iter(number, power, coef)
      if power == 1
        puts "final iter!"
        number * coef
      elsif power % 2 == 1
        puts "iter -1"
        calc_iter(number, power - 1, coef * number)
      else
        puts "iter :2"
        calc_iter(number * number, power / 2, coef)
      end
    end
  end
end

puts "10^5 -> #{Power.calc(10, 5)}\n\n"
puts "2^8 -> #{Power.calc(2, 8)}\n\n"
puts "3^7 -> #{Power.calc(3, 7)}\n\n"
puts "10^8 -> #{Power.calc(10, 8)}\n\n"
puts "2^9 -> #{Power.calc(2, 9)}\n\n"
puts "4^3 -> #{Power.calc(4, 3)}\n\n"
puts "11^5 -> #{Power.calc(11, 5)}"
