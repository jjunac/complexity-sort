class Insertion

    def initialize
        @name="InsertionSort"
    end
    attr_reader :name

    def sort(arr)
        res = arr.clone
        sort!(res)
        return res
    end

    def sort!(arr, lo = 0, hi = arr.length - 1)
        (lo+1).upto hi do |i|
            x = arr[i]
            j = i - 1
            while j >= 0 and arr[j] > x
                arr[j+1] = arr[j]
                j -= 1
            end
            arr[j+1] = x
        end
    end

end