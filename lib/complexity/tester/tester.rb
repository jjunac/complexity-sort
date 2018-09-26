require 'benchmark'

class Array
  def sum
    inject(0.0) {|result, el| result.real + el.real}
  end

  def mean
    sum / size
  end
end

class Tester

  def initialize(number_max = 1000, repeat = 1000, max_len = 8)
    @number_max = number_max
    @repeat = repeat
    @max_len = max_len
  end


  def execute(sort_algorithm)
    times = []
    for n in 1..@max_len
      array = generate_random(2 ** n)
      times[n - 1] = []
      for i in 0...@repeat
        time = Benchmark.measure {sort_algorithm.sort(array)}
        times[n - 1] << time
      end
      p times[n - 1][0].real
      mean = times[n - 1].mean
      p "The mean time for #{2 ** n} random values is #{mean}"
    end
    times
  end


  def generate_random(size)
    (0...size).map {rand(@number_max)}
  end
end