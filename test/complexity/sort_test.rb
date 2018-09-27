require "./test/test_helper"
require "./lib/complexity/sorts/quick"

class Complexity::SortTest < Minitest::Test
  def test_insertion
    insertion = Quick.new
    assert array_sorted?(insertion.sort([1, 2, 3, 4, 5]))
    assert array_sorted?(insertion.sort([5, 4, 3, 2, 1]))
    assert array_sorted?(insertion.sort([1, 2, 6, 4, 5]))
    assert array_sorted?(insertion.sort([3, 2, 6, 1, 5]))
  end

  def array_sorted?(arr)
    (1...arr.length).all? do |i|
      arr[i - 1] < arr[i]
    end
  end
end
