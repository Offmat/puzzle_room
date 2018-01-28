require 'csv'

file = File.expand_path("../csv_files/country_list.csv", __dir__)

CSV.foreach(file, headers: true) do |row|
  Country.new(name: row["name"]).save
end
