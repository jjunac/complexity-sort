require "./test/test_helper"
require "./lib/complexity/sorts/quick"
require "./lib/complexity/sorts/merge"
require "./lib/complexity/sorts/heap"
require "./lib/complexity/sorts/smooth"
require "./lib/complexity/tester/array_generator"
class Complexity::SortTest < Minitest::Test
  def test_all_algorithms
    algorithms = [Insertion.new, Merge.new, Quick.new, Heap.new, Smooth.new]
    # algorithms.each {|algo| check_algorithm(algo)}
  end

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

  def assert_array_sorted(arr)
    assert (1...arr.length).all? do |i|
      arr[i - 1] < arr[i]
    end
  end

  def assert_array_same_values(original, sorted)
    copy = original[0...original.length]
    assert_equal copy.sort, sorted.sort
  end

  def assert_array_correct(original, sorted)
    assert_array_sorted(sorted)
    assert_array_same_values(original, sorted)
  end

  def check_algorithm(algo)
    arr = [1, 2, 3, 4, 5]
    assert_array_correct(arr, algo.sort(arr))
    arr = [5, 4, 3, 2, 1]
    assert_array_correct(arr, algo.sort(arr))
    arr = [1, 2, 6, 4, 5]
    assert_array_correct(arr, algo.sort(arr))
    arr = [3, 2, 6, 1, 5]
    assert_array_correct(arr, algo.sort(arr))
    arr = [3, 2, 6, 1, 5, 7]
    assert_array_correct(arr, algo.sort(arr))

    generator = SeededRandomArrayGenerator.new(1234)
    arr = generator.generate(2 ** 4)
    assert_array_correct(arr, algo.sort(arr))
    arr = generator.generate(2 ** 5)
    assert_array_correct(arr, algo.sort(arr))
    arr = generator.generate(2 ** 6)
    assert_array_sorted(algo.sort(arr))
    # arr = generator.generate(2 ** 7)
    # assert_array_correct(arr, algo.sort(arr))
  end
end
