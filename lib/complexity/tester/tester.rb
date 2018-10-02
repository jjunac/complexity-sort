require 'benchmark'
require_relative 'array_generator'
class Array
    def sum
        inject(0.0) {|result, el| result + el}
    end

    def mean
        sum / size
    end
end

class Tester

    def initialize(number_max: 100000, repeat: 1000, max_time: 10, max_len: 8, log: false, array_generator: nil)
        @number_max = number_max
        @repeat = repeat
        @max_len = max_len
        @log = log
        @max_time = max_time
        if array_generator.nil?
            array_generator = RandomArrayGenerator.new(number_max: number_max)
        end
        @array_generator = array_generator
    end

    def execute_all(*algorithms)
        results = Hash.new
        sizes = []
        algorithms.each {|algorithm|
            results[algorithm.name], sizes = execute(algorithm)
        }
        [results, sizes]
    end

    def execute(sort_algorithm)
        start = Time.now
        times = []
        sizes = []
        means = []
        for n in 1..@max_len
            size = 2 ** n
            sizes << size
            times[n - 1] = []
            repeat = @repeat
            i = 0
            while i < repeat
                array = @array_generator.generate(size)
                time = Benchmark.measure {sort_algorithm.sort(array)}
                repeat = [(@max_time / time.real).floor, @repeat].min
                times[n - 1] << time.real
                i += 1
            end
            mean = times[n - 1].mean
            means << mean
            if @log
                p "#{sort_algorithm.name} sort: the mean time for #{size} random values is #{mean} with #{repeat} repeats"
            end
        end
        p "executed #{sort_algorithm.name} in #{(Time.now - start).round(10)} seconds"
        [means, sizes]
    end

end