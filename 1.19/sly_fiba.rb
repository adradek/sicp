module SlyFiba
  class << self
    def give_me_fibo(n)
      iter(1, 0, 0, 1, n)
    end

    def iter(a, b, p, q, count)
      return b if count.zero?
      count.even? \
        ? iter(a, b, q*q + p*p, q*(q + 2*p), count/2)
        : iter(q*(a + b) + p*a, q*a + p*b, p, q, count - 1)
    end
  end
end