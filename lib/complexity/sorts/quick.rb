require "./lib/complexity/sorts/insertion"

class Quick

    SWAP_TO_INSERTION = 1

    def initialize
        @insertion = Insertion.new
    end

    def random(arr, lo, hi)
        return arr[lo..hi].sample
    end

    def median_3(arr, lo, hi)
        if hi - lo == 1
            return arr[lo]
        end
        a = arr[lo]
        b = arr[lo+(hi-lo)/2]
        c = arr[hi]
        if a < b
            if a >= c
                return a
            else
                if b < c
                    return b
                else
                    return c
                end
            end
        else
            if a < c
                return a
            else
                if b >= c
                    return b
                else
                    return c
                end
            end
        end
    end

    def sort(arr)
        quicksort(arr, 0, arr.length-1, :median_3)
    end

    def quicksort(arr, lo, hi, pivot_choice)
        if hi <= lo
            return arr
        end
        if hi - lo <= SWAP_TO_INSERTION
            return @insertion.sort arr
        end
        if hi - lo == 1
            if arr[hi] < arr[lo]
                swap(arr, hi, lo)
            end
            return arr
        end

        # We use Hoare partition scheme
        pivot = send(pivot_choice, arr, lo, hi)
        i = lo-1
        j = hi + 1

        loop do
            loop do
                i += 1
                break if arr[i] < pivot
            end
            loop do
                j -= 1
                break if arr[j] > pivot
            end
            break if i >= j
            swap(arr, i, j)
        end

        quicksort(arr, lo, j, pivot_choice)
        quicksort(arr, j+1, hi, pivot_choice)
    end

    def swap(arr, i, j)
        tmp = arr[i]
        arr[i] = arr[j]
        arr[j] = tmp
    end

end