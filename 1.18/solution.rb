module Umnozhaka
  class << self
    def calc(a, b)
      calc_iter(a, b, 0)
    end

    def calc_iter(a, b, buf)
      return 0 if a.zero? || b.zero?
      return a + buf if b == 1
      if b.odd?
        calc_iter(a, b - 1, buf + a)
      else
        calc_iter(double(a), halve(b), buf)
      end
    end

    def double(x); x + x; end
    def halve(x); x / 2; end
  end
end

[[12, 8], [9, 6], [3, 11], [16, 16]].each do |a, b|
  puts "#{a} * #{b} = #{Umnozhaka.calc(a, b)}"
end
