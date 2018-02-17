# each question category should be broken into it's own .csv for the seed to run correctly.

seed_dir = './db/seeds/'

Dir.glob('./db/seeds/*.csv') do |item|
  next if item == '.' or item == '..'

  csv_text = File.read("#{item}")
  csv = CSV.parse(csv_text, :headers => true)
  csv_arr = []
  csv.each do |row|
    csv_arr << row.to_hash
  end
  puts "Read #{item}"
  next if Category.find_by(name: csv_arr[0]["category"])
  created_category = Category.find_or_create_by(name: csv_arr[0]["category"])
  csv_arr.each do |row|
    c = Choice.new
    c.name = row["name"]
    c.content = row["content"]
    c.img_url = row["img_url"]
    c.category = created_category
    c.save
  end
  created_category.generate_all_questions_for_category
  puts "Completed #{item}"
end

puts "Done. Generated #{Question.all.size} questions."
