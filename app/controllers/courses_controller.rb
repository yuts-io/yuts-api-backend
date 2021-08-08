class CoursesController < ApplicationController

    
    @@authed = false
    def index
        
        # courses = Course.getBySeason(202103).first(10)

        # courses = []

        # Course.find_each {|course| courses << course if course.season_code == 202103}

        
        # courses = Course.first(10)

        # if session['cas']['user'] 
        #     courses = Course.where("season_code = 202103").order(course_code: :asc).limit(150)
        #     render json: courses
        if (@@authed)
            courses = Course.where("season_code = 202103").order(course_code: :asc).limit(150)
            render json: courses
        else 
            render status: :unauthorized
            @@authed = true
        end
        # else 
            
            # byebug
        # end


    end


    def show
        course = Course.find_by(id: params[:id])
        render json: course
    end 

    def load 
        courses = Course.where("season_code = #{params[:season]}").order(course_code: :asc).offset(params[:amount])
        render json: courses
    end

    def new_season_home
        courses = Course.where("season_code = #{params[:season]}").order(course_code: :asc).limit(150)
        render json: courses
    end

    def seasonsList
        list = Course.pluck("season_code").uniq.sort.reverse


        # p list

        render json: list
    end
end
