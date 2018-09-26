class Insertion

    def initialize
    end

    def sort(arr)
        i = 1
        while i < arr.length
            x = arr[i]
            j = i - 1
            while j >= 0 and arr[j] > x
                arr[j+1] = arr[j]
                j -= 1
            end
            arr[j+1] = x
            i += 1
        end
    end

end