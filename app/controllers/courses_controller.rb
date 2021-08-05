class CoursesController < ApplicationController
    def index
        
        # courses = Course.getBySeason(202103).first(10)

        # courses = []

        # Course.find_each {|course| courses << course if course.season_code == 202103}

       courses = Course.where("season_code = 202103").order(course_code: :asc).limit(150)
        
        # courses = Course.first(10)

        


        render json: courses
    end


    def show
        course = Course.find_by(id: params[:id])
        render json: course
    end 

    def load 
        courses = Course.where("season_code = #{params[:season]}").order(course_code: :asc).offset(params[:amount])
        render json: courses
    end

    def season
        courses
    end

    def seasonsList
        list = Course.pluck("season_code").uniq.sort.reverse


        # p list

        render json: list
    end
end
