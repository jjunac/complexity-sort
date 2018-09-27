require 'csv'

class CSVExporter

  def initialize
  end

  def export_map(filename, sizes, data)
    sizes.unshift("array size")
    CSV.open(filename, "w", {:col_sep => ";", :write_headers => true,
                             :headers => sizes}) do |csv|
      data.each {|name, result|
        (0...result[0].length).each {|j|
          csv << (0...result.length).map {|i| result[i][j]}.unshift(name)
        }
      }
    end
  end
end