module RecursiveProcess
  def self.factorial(n)
    if n == 1
      1
    else
      factorial(n - 1) * n
    end
  end
end