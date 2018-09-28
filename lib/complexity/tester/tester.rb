require 'benchmark'

class Array
  def sum
    inject(0.0) {|result, el| result + el}
  end

  def mean
    sum / size
  end
end

class Tester

  def initialize(number_max: 1000, repeat: 1000, max_len: 8, log: false, random_generator: RandomArrayGenerator.new)
    @number_max = number_max
    @repeat = repeat
    @max_len = max_len
    @log = log
    @random_generator = random_generator
  end

  def execute_all(*algorithms)
    results = Hash.new
    sizes = []
    for algorithm in algorithms
      results[algorithm.class.name], sizes = execute(algorithm)
    end
    [results, sizes]
  end

  def execute(sort_algorithm)
    times = []
    sizes = []
    means = []
    for n in 1..@max_len
      size = 2 ** n
      sizes << size
      array = @random_generator.generate(size)
      times[n - 1] = []
      for i in 0...@repeat
        time = Benchmark.measure {sort_algorithm.sort(array)}
        times[n - 1] << time.real
      end
      mean = times[n - 1].mean
      means << mean
      if @log
        p "The mean time for #{size} random values is #{mean}"
      end
    end
    [means, sizes]
  end

end