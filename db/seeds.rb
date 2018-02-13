# csv_text = File.read("db/seeds/WYR.csv")
# csv = CSV.parse(csv_text, :headers => true)
# csv_arr = []
# csv.each do |row|
#   csv_arr << row.to_hash
# end
#
#
# cat = Category.find_or_create_by(name: csv_arr[0]["category"])
#
# csv_arr.each do |row|
#   c = Choice.new
#   c.name = row["name"]
#   c.content = row["content"]
#   c.img_url = row["img_url"]
#   c.category = cat
#   c.save
# end

Question.generate_all_questions
