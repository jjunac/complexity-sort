require_relative './tester/tester'
require_relative './tester/csv_exporter'
require_relative './sorts/insertion'
require_relative './sorts/heap'
require_relative './sorts/merge'
require_relative './sorts/quick'


class RubyDefault
    def name()
        return "Default Ruby sort"
    end

    def sort(array)
        array.sort
    end

end

def random(arr, lo, hi)
    return arr[lo..hi].sample
end

tester = Tester.new(max_len: 14, number_max: 1000000, max_time: 2, repeat: 1000, log: true)
csv_exporter = CSVExporter.new
insertion, sizes = tester.execute_all(Quick.new, Quick.new(pivot_choice: method(:random)), Insertion.new, Heap.new, Merge.new, RubyDefault.new)

csv_exporter.export_map("test.csv", sizes, insertion)