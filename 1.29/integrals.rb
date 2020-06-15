module Integral
  class << self
    def simple(f, a, b, dx)
      add_dx = -> (x) { x + dx }
      Sum.calc(f, a + dx / 2, add_dx, b) * dx
    end

    def simpson(f, a, b, n)
      h = (b - a) / n.to_f
      inc = -> (x) { x + 1 }
      
      part_simpson = -> (k) do
        coef ||= 1 if k == 0 or k == n
        coef ||= 2 if k.even?
        coef ||= 4

        coef * f.call(a + k * h)
      end

      Sum.calc(part_simpson, 0, inc, n) * h / 3
    end
  end
end

module Sum
  class << self
    def calc(term, a, next_a, b)
      return 0 if a > b + 0.00001
      # puts "a: #{a}, f(a): #{c(term).call(a)}"
      term.call(a) + calc(term, next_a.call(a), next_a, b)
    end
  end
end