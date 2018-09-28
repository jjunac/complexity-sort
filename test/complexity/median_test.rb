require "./lib/complexity/sorts/quick"
require "./test/test_helper"
class Complexity::MedianTest < Minitest::Test


    def median3()
        qs = Quick.new
        assert_equal(2, qs.median_3([1,2,3], 0, 2))
        assert_equal(2, qs.median_3([1,3,2], 0, 2))
        assert_equal(2, qs.median_3([2,1,3], 0, 2))
        assert_equal(2, qs.median_3([2,3,1], 0, 2))
        assert_equal(2, qs.median_3([3,1,2], 0, 2))
        assert_equal(2, qs.median_3([3,2,1], 0, 2))
    end

    def median5()
        qs = Quick.new
        assert_equal(3, qs.median_5([1,2,3,4,5], 0, 4))
        assert_equal(3, qs.median_5([1,2,3,5,4], 0, 4))
        assert_equal(3, qs.median_5([1,2,4,3,5], 0, 4))
        assert_equal(3, qs.median_5([1,2,4,5,3], 0, 4))
        assert_equal(3, qs.median_5([1,2,5,3,5], 0, 4))
        assert_equal(3, qs.median_5([1,2,5,4,3], 0, 4))
        
        assert_equal(3, qs.median_5([1,3,2,4,5], 0, 4))
        assert_equal(3, qs.median_5([1,3,2,5,4], 0, 4))
        assert_equal(3, qs.median_5([1,3,4,2,5], 0, 4))
        assert_equal(3, qs.median_5([1,3,4,5,2], 0, 4))
        assert_equal(3, qs.median_5([1,3,5,2,5], 0, 4))
        assert_equal(3, qs.median_5([1,3,5,4,2], 0, 4))

        assert_equal(3, qs.median_5([1,4,2,3,5], 0, 4))
        assert_equal(3, qs.median_5([1,4,2,5,3], 0, 4))
        assert_equal(3, qs.median_5([1,4,3,2,5], 0, 4))
        assert_equal(3, qs.median_5([1,4,3,5,2], 0, 4))
        assert_equal(3, qs.median_5([1,4,5,2,3], 0, 4))
        assert_equal(3, qs.median_5([1,4,5,3,2], 0, 4))

        assert_equal(3, qs.median_5([1,5,2,3,4], 0, 4))
        assert_equal(3, qs.median_5([1,5,2,4,3], 0, 4))
        assert_equal(3, qs.median_5([1,5,3,2,4], 0, 4))
        assert_equal(3, qs.median_5([1,5,3,4,2], 0, 4))
        assert_equal(3, qs.median_5([1,5,4,2,3], 0, 4))
        assert_equal(3, qs.median_5([1,5,4,3,2], 0, 4))

        
        assert_equal(3, qs.median_5([2,1,3,4,5], 0, 4))
        assert_equal(3, qs.median_5([2,1,3,5,4], 0, 4))
        assert_equal(3, qs.median_5([2,1,4,3,5], 0, 4))
        assert_equal(3, qs.median_5([2,1,4,5,3], 0, 4))
        assert_equal(3, qs.median_5([2,1,5,3,5], 0, 4))
        assert_equal(3, qs.median_5([2,1,5,4,3], 0, 4))

        assert_equal(3, qs.median_5([2,3,1,4,5], 0, 4))
        assert_equal(3, qs.median_5([2,3,1,5,4], 0, 4))
        assert_equal(3, qs.median_5([2,3,4,1,5], 0, 4))
        assert_equal(3, qs.median_5([2,3,4,5,1], 0, 4))
        assert_equal(3, qs.median_5([2,3,5,1,5], 0, 4))
        assert_equal(3, qs.median_5([2,3,5,4,1], 0, 4))

        assert_equal(3, qs.median_5([2,4,1,3,5], 0, 4))
        assert_equal(3, qs.median_5([2,4,1,5,3], 0, 4))
        assert_equal(3, qs.median_5([2,4,3,1,5], 0, 4))
        assert_equal(3, qs.median_5([2,4,3,5,1], 0, 4))
        assert_equal(3, qs.median_5([2,4,5,1,3], 0, 4))
        assert_equal(3, qs.median_5([2,4,5,3,1], 0, 4))

        assert_equal(3, qs.median_5([2,5,1,3,4], 0, 4))
        assert_equal(3, qs.median_5([2,5,1,4,3], 0, 4))
        assert_equal(3, qs.median_5([2,5,3,1,4], 0, 4))
        assert_equal(3, qs.median_5([2,5,3,4,1], 0, 4))
        assert_equal(3, qs.median_5([2,5,4,1,3], 0, 4))
        assert_equal(3, qs.median_5([2,5,4,3,1], 0, 4))


        assert_equal(3, qs.median_5([3,1,2,4,5], 0, 4))
        assert_equal(3, qs.median_5([3,1,2,5,4], 0, 4))
        assert_equal(3, qs.median_5([3,1,4,2,5], 0, 4))
        assert_equal(3, qs.median_5([3,1,4,5,2], 0, 4))
        assert_equal(3, qs.median_5([3,1,5,2,5], 0, 4))
        assert_equal(3, qs.median_5([3,1,5,4,2], 0, 4))

        assert_equal(3, qs.median_5([3,2,1,4,5], 0, 4))
        assert_equal(3, qs.median_5([3,2,1,5,4], 0, 4))
        assert_equal(3, qs.median_5([3,2,4,1,5], 0, 4))
        assert_equal(3, qs.median_5([3,2,4,5,1], 0, 4))
        assert_equal(3, qs.median_5([3,2,5,1,5], 0, 4))
        assert_equal(3, qs.median_5([3,2,5,4,1], 0, 4))

        assert_equal(3, qs.median_5([3,4,1,2,5], 0, 4))
        assert_equal(3, qs.median_5([3,4,1,5,2], 0, 4))
        assert_equal(3, qs.median_5([3,4,2,1,5], 0, 4))
        assert_equal(3, qs.median_5([3,4,2,5,1], 0, 4))
        assert_equal(3, qs.median_5([3,4,5,1,2], 0, 4))
        assert_equal(3, qs.median_5([3,4,5,2,1], 0, 4))

        assert_equal(3, qs.median_5([3,5,1,2,4], 0, 4))
        assert_equal(3, qs.median_5([3,5,1,4,2], 0, 4))
        assert_equal(3, qs.median_5([3,5,2,1,4], 0, 4))
        assert_equal(3, qs.median_5([3,5,2,4,1], 0, 4))
        assert_equal(3, qs.median_5([3,5,4,1,2], 0, 4))
        assert_equal(3, qs.median_5([3,5,4,2,1], 0, 4))


        assert_equal(3, qs.median_5([4,1,2,3,5], 0, 4))
        assert_equal(3, qs.median_5([4,1,2,5,3], 0, 4))
        assert_equal(3, qs.median_5([4,1,3,2,5], 0, 4))
        assert_equal(3, qs.median_5([4,1,3,5,2], 0, 4))
        assert_equal(3, qs.median_5([4,1,5,2,3], 0, 4))
        assert_equal(3, qs.median_5([4,1,5,3,2], 0, 4))

        assert_equal(3, qs.median_5([4,2,1,3,5], 0, 4))
        assert_equal(3, qs.median_5([4,2,1,5,3], 0, 4))
        assert_equal(3, qs.median_5([4,2,3,1,5], 0, 4))
        assert_equal(3, qs.median_5([4,2,3,5,1], 0, 4))
        assert_equal(3, qs.median_5([4,2,5,1,3], 0, 4))
        assert_equal(3, qs.median_5([4,2,5,3,1], 0, 4))

        assert_equal(3, qs.median_5([4,3,1,2,5], 0, 4))
        assert_equal(3, qs.median_5([4,3,1,5,2], 0, 4))
        assert_equal(3, qs.median_5([4,3,2,1,5], 0, 4))
        assert_equal(3, qs.median_5([4,3,2,5,1], 0, 4))
        assert_equal(3, qs.median_5([4,3,5,1,2], 0, 4))
        assert_equal(3, qs.median_5([4,3,5,2,1], 0, 4))

        assert_equal(3, qs.median_5([4,5,1,2,3], 0, 4))
        assert_equal(3, qs.median_5([4,5,1,3,2], 0, 4))
        assert_equal(3, qs.median_5([4,5,2,1,3], 0, 4))
        assert_equal(3, qs.median_5([4,5,2,3,1], 0, 4))
        assert_equal(3, qs.median_5([4,5,3,1,2], 0, 4))
        assert_equal(3, qs.median_5([4,5,3,2,1], 0, 4))


        assert_equal(3, qs.median_5([5,1,2,3,4], 0, 4))
        assert_equal(3, qs.median_5([5,1,2,4,3], 0, 4))
        assert_equal(3, qs.median_5([5,1,3,2,4], 0, 4))
        assert_equal(3, qs.median_5([5,1,3,4,2], 0, 4))
        assert_equal(3, qs.median_5([5,1,4,2,3], 0, 4))
        assert_equal(3, qs.median_5([5,1,4,3,2], 0, 4))

        assert_equal(3, qs.median_5([5,2,1,3,4], 0, 4))
        assert_equal(3, qs.median_5([5,2,1,4,3], 0, 4))
        assert_equal(3, qs.median_5([5,2,3,1,4], 0, 4))
        assert_equal(3, qs.median_5([5,2,3,4,1], 0, 4))
        assert_equal(3, qs.median_5([5,2,4,1,3], 0, 4))
        assert_equal(3, qs.median_5([5,2,4,3,1], 0, 4))

        assert_equal(3, qs.median_5([5,3,1,2,4], 0, 4))
        assert_equal(3, qs.median_5([5,3,1,4,2], 0, 4))
        assert_equal(3, qs.median_5([5,3,2,1,4], 0, 4))
        assert_equal(3, qs.median_5([5,3,2,4,1], 0, 4))
        assert_equal(3, qs.median_5([5,3,4,1,2], 0, 4))
        assert_equal(3, qs.median_5([5,3,4,2,1], 0, 4))

        assert_equal(3, qs.median_5([5,4,1,2,3], 0, 4))
        assert_equal(3, qs.median_5([5,4,1,3,2], 0, 4))
        assert_equal(3, qs.median_5([5,4,2,1,3], 0, 4))
        assert_equal(3, qs.median_5([5,4,2,3,1], 0, 4))
        assert_equal(3, qs.median_5([5,4,3,1,2], 0, 4))
        assert_equal(3, qs.median_5([5,4,3,2,1], 0, 4))

    end

    def test_median()
        median3
        median5
    end
end
