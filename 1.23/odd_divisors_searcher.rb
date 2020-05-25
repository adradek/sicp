module OddDivisorsSearcher
  class << self
    def calc(n)
      find_divisor(n, 2)
    end

    def find_divisor(n, d)
      return n if d * d > n
      return d if n % d == 0
      find_divisor(n, next_(d))
    end

    def next_(d)
      d == 2 ? 3 : d + 2
    end
  end
end