# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Course.count == 0
    path = File.join(File.dirname(__FILE__), "/ct-data/202103.json")
    records = JSON.parse(File.read(path))
    records.map do |record|
        record.delete("times_by_day")
        record["all_course_codes"] = record["all_course_codes"].join(', ')
        record["areas"] = record["areas"].join(', ')
        
        record["flag_info"] = record["flag_info"].join(', ')
        record["professor_names"] = record["professor_names"].join(', ')
        record["skills"] = record["skills"].join(', ')

        Course.create(record)
    end
    # puts records

end

Dir.foreach('/ct-data/') do |filename|
    next if filename == '.' or filename == '..'
    
end