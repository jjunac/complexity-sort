class Insertion

    def initialize
    end

    def sort(arr)
        q = 1
        r = 0
        p = 1
        b = 1
        c = 1

        while q < arr.length
            r1 = r
            if p % 8 == 3
                b1 = b
                c1 = c
                sift()
                p = (p+1)/4
                up(b,c)
                up(b,c)
            elsif p % 4 == 1
                if q + c < arr.length
                    b1 = b
                    c1 = c
                    sift()
                else
                    trinkle()
                end
                down(b,c)
                p *= 2
                while b > 1
                    down(b,c)
                    p *= 2
                end
                p += 1
            end
            q += 1
            r += 1
        end

        r1 = r
        trinkle()

        while q > 1
            q -= 1
            if b == 1
                r -= 1
                p -= 1
                while p % 2 == 0
                    p /= 2
                    up(b,c)
                end
            else
                # To be continued...
            end
        end

    end

end