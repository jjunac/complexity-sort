class Insertion

    def initialize
    end

    def sort(arr)
        1.upto arr.length - 1 do |i|
            x = arr[i]
            j = i - 1
            while j >= 0 and arr[j] > x
                arr[j+1] = arr[j]
                j -= 1
            end
            arr[j+1] = x
            i += 1
        end
        return arr
    end

end