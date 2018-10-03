require_relative 'insertion'

class Quick

    def initialize(swap_to_insertion: 12, pivot_choice: method(:median_5))
        @insertion = Insertion.new
        @swap_to_insertion = swap_to_insertion
        @pivot_choice = pivot_choice
        @name = "QuickSort Pivot: #{pivot_choice.name} Insertion: #{swap_to_insertion}"
    end

    attr_reader :name

    def random(arr, lo, hi)
        return arr[lo..hi].sample
    end

    def lowest(arr, lo, hi)
        return lo
    end

    def median_3(arr, lo, hi)
        if hi - lo == 1
            return arr[lo]
        end
        a = arr[lo]
        b = arr[lo + (hi - lo) / 2]
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

    def median_5(arr, lo, hi)
        if hi - lo == 1
            return arr[lo]
        end
        a = arr[lo]
        b = arr[lo + (hi - lo) / 4]
        c = arr[lo + (hi - lo) / 2]
        d = arr[lo + 3 * (hi - lo) / 4]
        e = arr[hi]
        if a < b
            # a < b
            if a >= c
                # c < a < b
                if d < a
                    # d < a
                    # c < a < b
                    if a < e
                        return a
                    else
                        # d < a
                        # e < a
                        # c < a < b
                        if e < c
                            #     d < a
                            # e < c < a < b
                            if d < c
                                return c
                            else
                                return d
                            end
                        else
                            #     d < a
                            # c < e < a < b
                            if d < e
                                return e
                            else
                                return d
                            end
                        end
                    end
                else
                    #     a < d
                    # c < a < b
                    if e < a
                        return a
                    else
                        #     a < e
                        #     a < d
                        # c < a < b
                        if b < d
                            #     a < e
                            # c < a < b < d
                            if b < e
                                return b
                            else
                                return e
                            end
                        else
                            #     a < e
                            # c < a < d < b
                            if d < e
                                return d
                            else
                                return e
                            end
                        end
                    end
                end
            else
                # a < b
                # a < c
                if b < c
                    # a < b < c
                    if d < b
                        # a < b < c
                        # d < b
                        if b < e
                            return b
                        else
                            # a < b < c
                            # d < b
                            # e < b
                            if d < a
                                # d < a < b < c
                                #     e < b
                                if e < a
                                    return a
                                else
                                    return e
                                end
                            else
                                # a < d < b < c
                                #     e < b
                                if e < d
                                    return d
                                else
                                    return e
                                end
                            end
                        end
                    else
                        # a < b < c
                        #     b < d
                        if e < b
                            return b
                        else
                            #     b < e
                            #     b < d
                            # a < b < c
                            if c < d
                                #     b < e
                                # a < b < c < d
                                if c < e
                                    return c
                                else
                                    return e
                                end
                            else
                                #     b < e
                                # a < b < d < c
                                if d < e
                                    return d
                                else
                                    return e
                                end
                            end
                        end
                    end
                else
                    # a < c < b
                    if d < c
                        # a < c < b
                        # d < c
                        if c < e
                            return c
                        else
                            # a < c < b
                            # d < c
                            # e < c
                            if d < a
                                # d < a < c < b
                                #     e < c
                                if e < a
                                    return a
                                else
                                    return e
                                end
                            else
                                # a < d < c < b
                                #     e < c
                                if e < d
                                    return d
                                else
                                    return e
                                end
                            end
                        end
                    else
                        # a < c < b
                        #     c < d
                        if e < c
                            return c
                        else
                            #     c < e
                            #     c < d
                            # a < c < b
                            if b < d
                                #     c < e
                                # a < c < b < d
                                if b < e
                                    return b
                                else
                                    return e
                                end
                            else
                                #     c < e
                                # a < c < d < b
                                if d < e
                                    return d
                                else
                                    return e
                                end
                            end
                        end
                    end
                end
            end
        else
            # b < a
            if a < c
                # b < a < c
                if d < a
                    # b < a < c
                    # d < a
                    if a < e
                        return a
                    else
                        # b < a < c
                        # d < a
                        # e < a
                        if d < b
                            # d < b < a < c
                            #     e < a
                            if e < b
                                return b
                            else
                                return e
                            end
                        else
                            # b < d < a < c
                            #     e < a
                            if e < d
                                return d
                            else
                                return e
                            end
                        end
                    end
                else
                    # b < a < c
                    #     a < d
                    if e < a
                        return a
                    else
                        #     a < e
                        #     a < d
                        # b < a < c
                        if c < d
                            #     a < e
                            # b < a < c < d
                            if c < e
                                return c
                            else
                                return e
                            end
                        else
                            #     a < e
                            # b < a < d < c
                            if d < e
                                return d
                            else
                                return e
                            end
                        end
                    end
                end
            else
                # b < a
                # c < a
                if b >= c
                    # c < b < a
                    if d < b
                        # c < b < a
                        # d < b
                        if b < e
                            return b
                        else
                            # c < b < a
                            # d < b
                            # e < b
                            if d < c
                                # d < c < b < a
                                #     e < b
                                if e < c
                                    return c
                                else
                                    return e
                                end
                            else
                                # c < d < b < a
                                #     e < b
                                if e < d
                                    return d
                                else
                                    return e
                                end
                            end
                        end
                    else
                        # c < b < a
                        #     b < d
                        if e < b
                            return b
                        else
                            #     b < e
                            #     b < d
                            # c < b < a
                            if a < d
                                #     b < e
                                # c < b < a < d
                                if a < e
                                    return a
                                else
                                    return e
                                end
                            else
                                #     b < e
                                # c < b < d < a
                                if d < e
                                    return d
                                else
                                    return e
                                end
                            end
                        end
                    end
                else
                    # b < c < a
                    if d < c
                        # b < c < a
                        # d < c
                        if c < e
                            return c
                        else
                            # b < c < a
                            # d < c
                            # e < c
                            if d < b
                                # d < b < c < a
                                #     e < c
                                if e < b
                                    return b
                                else
                                    return e
                                end
                            else
                                # b < d < c < a
                                #     e < c
                                if e < d
                                    return d
                                else
                                    return e
                                end
                            end
                        end
                    else
                        # b < c < a
                        #     c < d
                        if e < c
                            return c
                        else
                            #     c < e
                            #     c < d
                            # b < c < a
                            if a < d
                                #     c < e
                                # b < c < a < d
                                if a < e
                                    return a
                                else
                                    return e
                                end
                            else
                                #     c < e
                                # b < c < d < a
                                if d < e
                                    return d
                                else
                                    return e
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    def sort(arr)
        res = arr.clone
        sort!(res)
        return res
    end

    def sort!(arr)
        quicksort(arr, 0, arr.length - 1)
    end

    def quicksort(arr, lo, hi)
        if hi <= lo
            return
        end
        if hi - lo <= @swap_to_insertion
            @insertion.sort!(arr, lo, hi)
            return
        end
        if hi - lo == 1
            if arr[hi] < arr[lo]
                swap(arr, hi, lo)
            end
            return
        end

        # We use Hoare partition scheme
        pivot = @pivot_choice.call(arr, lo, hi)
        i = lo - 1
        j = hi + 1

        loop do
            loop do
                i += 1
                break if arr[i] >= pivot
            end
            loop do
                j -= 1
                break if arr[j] <= pivot
            end
            break if i >= j
            swap(arr, i, j)
        end

        quicksort(arr, lo, j)
        quicksort(arr, j + 1, hi)
    end

    def swap(arr, i, j)
        tmp = arr[i]
        arr[i] = arr[j]
        arr[j] = tmp
    end

end