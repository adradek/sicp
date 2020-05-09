module IterativeProcess
  def self.factorial(n)
    fact_iter(1, 1, n)
  end

  def self.fact_iter(product, counter, max_count)
    return product if counter > max_count
    fact_iter(counter * product, counter + 1, max_count)
  end
end