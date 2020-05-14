module Summozvedenie
  class << self
    def fast_product(a, b)
      return 0 if [a, b].any?(&:zero?)
      return a if b == 1
      return fast_product(double(a), halve(b)) if b.even?
      a + fast_product(a, b - 1)
    end

    def double(x)
      x + x
    end 

    def halve(x)
      x / 2
    end
  end
end
  
puts "7 * 8 = #{Summozvedenie.fast_product(7, 8)}"
puts "7 * 9 = #{Summozvedenie.fast_product(7, 9)}"
puts "5 * 5 = #{Summozvedenie.fast_product(5, 5)}"
puts "6 * 4 = #{Summozvedenie.fast_product(6, 4)}"
puts "8 * 11 = #{Summozvedenie.fast_product(8, 11)}"
puts "9000 * 8000 = #{Summozvedenie.fast_product(9000, 8000)}"