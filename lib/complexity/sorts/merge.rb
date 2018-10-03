class Merge

    def initialize
        @name="MergeSort"
    end
    attr_reader :name

    def sort(arr)
        if arr.length <= 1
            return arr
        end
        mid = arr.length / 2
        left = sort arr.take mid
        right = sort arr.drop mid

        return merge(left, right)
    end

    def merge(left, right)
        res = []

        until left.empty? or right.empty?
            if left.first <= right.first
                res << left.shift
            else
                res << right.shift
            end
        end

        unless left.empty?
            res += left
        end
        unless right.empty?
            res += right
        end

        return res
    end

end