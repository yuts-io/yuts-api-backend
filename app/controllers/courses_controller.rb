class CoursesController < ApplicationController

    def index
        courses = Course.where("season_code = 202103").order(course_code: :asc).limit(150)
        render json: courses
    end

    def show
        course = Course.find_by(id: params[:id])
        render json: course, include: [:comments]     
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
        render json: list
    end



end
