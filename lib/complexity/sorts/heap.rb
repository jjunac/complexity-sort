class Heap

    def initialize
        @name="HeapSort"
    end
    attr_reader :name

    def parent(i)
        ((i-1)/2).floor
    end

    def leftchild(i)
        2*i+1
    end

    def rightchild(i)
        2*i+2
    end

    def sort(arr)
        res = arr.clone
        sort!(res)
        return res
    end

    def sort!(arr)
        heapify(arr)

        (arr.length-1).downto 1 do |i|
            swap(arr, i, 0)
            siftdown(arr, 0, i-1)
        end
    end

    def heapify(arr)
        start = parent arr.length - 1
        start.downto(0) { |parent| siftdown(arr, parent, arr.length - 1) }
    end

    def siftdown (arr, start, endd)
        root = start

        while (child = leftchild(root)) <= endd
            swp = root

            if arr[swp] < arr[child] then swp = child end
            if child + 1 <= endd and arr[swp] < arr[child+1]
                swp = child + 1
            end
            if swp == root
                return
            else
                swap(arr, root, swp)
                root = swp
            end
        end
    end

    def swap(arr, i, j)
        tmp = arr[i]
        arr[i] = arr[j]
        arr[j] = tmp
    end

end