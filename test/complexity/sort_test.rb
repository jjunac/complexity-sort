require "./test/test_helper"
require "./lib/complexity/sorts/quick"
require "./lib/complexity/sorts/insertion"
require "./lib/complexity/sorts/merge"
require "./lib/complexity/sorts/heap"

class Complexity::SortTest < Minitest::Test
  def test_all_algorithms
    algorithms = [Insertion.new, Merge.new, Quick.new, Heap.new]
    algorithms.each {|algo| check_algorithm(algo)}
  end

  def array_sorted?(arr)
    (1...arr.length).all? do |i|
      arr[i - 1] < arr[i]
    end
  end

  private

  def check_algorithm(insertion)
    assert array_sorted?(insertion.sort([1, 2, 3, 4, 5]))
    assert array_sorted?(insertion.sort([5, 4, 3, 2, 1]))
    assert array_sorted?(insertion.sort([1, 2, 6, 4, 5]))
    assert array_sorted?(insertion.sort([3, 2, 6, 1, 5]))
    assert array_sorted?(insertion.sort([3, 2, 6, 1, 5,7,5466,46,4857,435,23477,8765,342]))
  end
end
