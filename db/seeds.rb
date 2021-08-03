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

        if (record["average_rating"] == nil || record["average_workload"] == nil)
            record["gut_index"] = nil
        else 
            rating_work_ratio = record["average_rating"]/record["average_workload"]

            if rating_work_ratio > 1
                raw_score = (1 - ((2.5 - rating_work_ratio)/1.5)) * 50

                raw_score += 50 # balance scale to max of 100
            elsif rating_work_ratio < 1
                raw_score = (1 - ((1-rating_work_ratio)/0.8)) * 50
            else
                raw_score = 50.0
            end


            if raw_score > 100 
                record["gut_index"] = 100.0
            else    
                record["gut_index"] = raw_score
            end
        end

        

        # Course.create(record)
    end
    puts records

end


# Dir.children("./db/ct-data").each do |filename|
#     path = File.join(File.dirname(__FILE__), "/ct-data/#{filename}")
#     records = JSON.parse(File.read(path))
#     records.map do |record|
#         record.delete("times_by_day")
#         record["all_course_codes"] = record["all_course_codes"].join(', ')
#         record["areas"] = record["areas"].join(', ')
        
#         record["flag_info"] = record["flag_info"].join(', ')
#         record["professor_names"] = record["professor_names"].join(', ')
#         record["skills"] = record["skills"].join(', ')

#         Course.create(record)
#     end
# end

# helper fcns


def getGutIndex(record_hash)

    
end