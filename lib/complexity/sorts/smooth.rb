class Smooth

    def initialize
        @name="SmoothSort"
    end
    attr_reader :name

    def up(); tmp = @b; @b += @c + 1; @c = tmp end
    def down(); tmp = @b; @b = @c; @c = tmp - @c - 1 end

    def up1(); tmp = @b1; @b1 += @c1 + 1; @c1 = tmp end
    def down1(); tmp = @b1; @b1 = @c1; @c1 = tmp - @c1 - 1 end

    def swap(arr, i, j)
        tmp = arr[i]
        arr[i] = arr[j]
        arr[j] = tmp
    end

    def sort(arr)
        res = arr.clone
        sort!(res)
        return res
    end

    def sort!(arr)
        @q = 1
        @r = 0
        @p = 1
        @b = 1
        @c = 1

        while @q < arr.length
            @r1 = @r
            if @p % 8 == 3
                @b1 = @b
                @c1 = @c
                sift(arr)
                @p = (@p+1)/4
                up
                up
            elsif @p % 4 == 1
                if @q + @c < arr.length
                    @b1 = @b
                    @c1 = @c
                    sift(arr)
                else
                    trinkle(arr)
                end
                down
                @p *= 2
                while @b > 1
                    down
                    @p *= 2
                end
                @p += 1
            end
            @q += 1
            @r += 1
        end

        @r1 = @r
        trinkle(arr)

        while @q > 1
            @q -= 1
            if @b == 1
                @r -= 1
                @p -= 1
                while @p % 2 == 0
                    @p /= 2
                    up
                end
            elsif @b >= 3
                @p -= 1
                @r = @r - @b + @c
                if @p > 0
                    semitrinkle(arr)
                end
                down
                @p = 2*@p + 1
                @r = @r + @c
                semitrinkle(arr)
                down
                @p = 2*@p + 1
            end
        end

    end

    def sift(arr)
        while @b1 >= 3
            r2 = @r1 - @b1 + @c1
            if arr[r2] <= arr[@r1 - 1]
                r2 = @r1 - 1
                down1
            end
            if arr[@r1] >= arr[r2]
                @b1 = 1
            else
                swap(arr, @r1, r2)
                @r1 = r2
                down1
            end
        end
    end

    def trinkle(arr)
        p1 = @p
        @b1 = @b
        @c1 = @c
        while p1 > 0
            while p1 % 2 == 0
                p1 /= 2
                up1
            end
            r3 = @r1 - @b1
            if p1 == 1 or arr[r3] <= arr[@r1]
                p1 = 0
            elsif p1 > 1 and arr[r3] > arr[@r1]
                p1 -= 1
                if @b1 == 1
                    swap(arr, @r1, r3)
                    @r1 = r3
                elsif @b1 >= 3
                    r2 = @r1 - @b1 + @c1
                    if arr[r2] <= arr[@r1 - 1]
                        r2 = @r1 - 1
                        down1
                        p1 *= 2
                    end
                    if arr[r3] >= arr[r2]
                        swap(arr, @r1, r3)
                        @r1 = r3
                    else
                        swap(arr, @r1, r2)
                        @r1 = r2
                        down1
                        p1 = 0
                    end
                end
            end
        end
        sift(arr)
    end

    def semitrinkle(arr)
        @r1 = @r - @c
        if arr[@r1] > arr[@r]
            swap(arr, @r, @r1)
            trinkle(arr)
        end
    end

end