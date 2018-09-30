require "./test/test_helper"
require "./lib/complexity/sorts/quick"
require "./lib/complexity/sorts/merge"
require "./lib/complexity/sorts/heap"
require "./lib/complexity/sorts/smooth"
require "./lib/complexity/tester/array_generator"
class Complexity::SortTest < Minitest::Test

    def test_heap
        check_algorithm(Heap.new)
    end

    def test_insertion
        check_algorithm(Insertion.new)
    end

    def test_quick
        check_algorithm(Quick.new)
    end

    def test_merge
        check_algorithm(Merge.new)
    end

    def test_smooth
      check_algorithm(Smooth.new)
    end

    def assert_array_correct(original, sorted)
        assert_equal original.sort, sorted
    end

    def check_algorithm(algo)


        arr = [1, 2, 3, 4, 5]
        assert_array_correct(arr, algo.sort(arr))

        arr = [5, 4, 3, 2, 1, 0]
        assert_array_correct(arr, algo.sort(arr))

        arr = [1, 2, 6, 4, 5]
        assert_array_correct(arr, algo.sort(arr))


        arr = [3, 1, 2, 1, 3, 4, 3, 2, 4]
        assert_array_correct(arr, algo.sort(arr))

        generator = SeededRandomArrayGenerator.new(1234)

        4.upto 12 do |i|
            arr = generator.generate(2 ** i)
            assert_array_correct(arr, algo.sort(arr))
        end

    end
end
