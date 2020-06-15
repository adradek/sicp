module SumIter
  def self.calc(a, b, term, nexta)
    calc_iter(a, b, term, nexta, 0)
  end

  def self.calc_iter(a, b, term, nexta, sum)
    return sum if a > b
    calc_iter(nexta.call(a), b, term, nexta, sum + term.call(a))
  end
end

itself = -> (x) { x }
inc = -> (x) { x.next }

puts "Sum 1..20: #{SumIter.calc(1, 20, itself, inc)}"