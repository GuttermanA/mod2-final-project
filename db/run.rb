require 'csv'
require 'pry'

csv_text = File.read("db/seed.csv")
csv = CSV.parse(csv_text, :headers => true)
csv_arr = []
csv.each do |row|
  csv_arr << row.to_hash
  # Moulding.create!(row.to_hash)
end


# csv_hash = ::CSV.foreach("db/seed.csv", :headers => true) do |row|
#   Moulding.create!(row.to_hash)
#   puts row.inspect
# end

Pry.start
