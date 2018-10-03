require './lib/complexity/tester/tester'
require './lib/complexity/sorts/insertion'
require './lib/complexity/tester/tester'
require './lib/complexity/tester/csv_exporter'
require './lib/complexity/sorts/insertion'
require './lib/complexity/sorts/heap'
require './lib/complexity/sorts/merge'
require './lib/complexity/sorts/quick'
require './lib/complexity/sorts/smooth'


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

tester = Tester.new(max_len: 16, max_time: 10, repeat: 1000, log: true)
csv_exporter = CSVExporter.new
insertion, sizes = tester.execute_all(Quick.new, Quick.new(pivot_choice: method(:random)), Insertion.new, Heap.new, Merge.new, Smooth.new, RubyDefault.new)

csv_exporter.export_map("test.csv", sizes, insertion)