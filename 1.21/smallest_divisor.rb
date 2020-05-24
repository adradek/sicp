module SmallestDivisor
  class << self
    def calc(n)
      find_divisor(n, 2)
    end

    def find_divisor(n, divisor)
      return n if divisor ** 2 > n
      return divisor if divides?(n, divisor)
      find_divisor(n, divisor + 1)
    end

    def divides?(number, divisor)
      number % divisor == 0
    end
  end
end
