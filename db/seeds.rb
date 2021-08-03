# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# if Course.count == 0
path = File.join(File.dirname(__FILE__), "/ct-data/202103.json")
records = JSON.parse(File.read(path))





records_w_guts = records.each do |record|
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
    Course.create(record)
    
end




gut_indices_objs = Course.all.select {|course| (course.gut_index != nil)}

get_percentile(gut_indices_objs, gut_percentile)

# sorted_gut_objs = gut_indices_objs.sort_by { |course| course.gut_index}


# count = gut_indices_objs.count




# sorted_gut_objs.each_with_index do |course, i|

#     # L/N(100) = P
#     # L = number of scores beneath this score (score array index)
#     # N = total number of scores
#     # P = percentile

#     # p records_w_guts[i]
#     # puts gut
#     perc = (i.to_f/count.to_f*100).ceil

#     course_find = Course.find_by(id: course.id)

#     p course_find

#     course_find.gut_percentile = perc

#     p course_find.gut_percentile

#     course_find.save
#   end








# end


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

#         if (record["average_rating"] == nil || record["average_workload"] == nil)
#             record["gut_index"] = nil
#         else 
#             rating_work_ratio = record["average_rating"]/record["average_workload"]

#             if rating_work_ratio > 1
#                 raw_score = (1 - ((2.5 - rating_work_ratio)/1.5)) * 50

#                 raw_score += 50 # balance scale to max of 100
#             elsif rating_work_ratio < 1
#                 raw_score = (1 - ((1-rating_work_ratio)/0.8)) * 50
#             else
#                 raw_score = 50.0
#             end


#             if raw_score > 100 
#                 record["gut_index"] = 100.0
#             else    
#                 record["gut_index"] = raw_score
#             end
#         end
#         Course.create(record)
#     end
# end

# helper fcns

def get_percentile(objs, category)

    sorted_objs = objs.sort_by { |course| course.gut_index}


    count = objs.count

    # puts sorted_gut_objs[-1].gut_index



    sorted_objs.each_with_index do |course, i|

        # L/N(100) = P
        # L = number of scores beneath this score (score array index)
        # N = total number of scores
        # P = percentile

        # p records_w_guts[i]
        # puts gut
        percentile = (i.to_f/count.to_f*100).ceil

        course_obj = Course.find_by(id: course.id)

        course_obj.category = percentile

        course_obj.save
    end

end