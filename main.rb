require './lib/complexity/tester/tester'
require './lib/complexity/sorts/insertion'
require './lib/complexity/tester/tester'
require './lib/complexity/tester/csv_exporter'
require './lib/complexity/sorts/insertion'
require './lib/complexity/sorts/heap'
require './lib/complexity/sorts/merge'
require './lib/complexity/sorts/quick'
require './lib/complexity/sorts/smooth'
require './lib/complexity/sorts/quick_lin'


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

tester = Tester.new(max_len: 16, max_time: 5, repeat: 1000, log: true)
csv_exporter = CSVExporter.new
insertion, sizes = tester.execute_all(QuickLin.new,QuickLin.new(swap_to_insertion: 64), Quick.new(swap_to_insertion: 64),
                                      Quick.new, Quick.new(swap_to_insertion: 128), RubyDefault.new)
# insertion, sizes = tester.execute_all(Quick.new(swap_to_insertion: 16),Quick.new, Quick.new(swap_to_insertion: 32), Merge.new, RubyDefault.new)

csv_exporter.export_map("test.csv", sizes, insertion)