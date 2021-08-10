class StudentsController < ApplicationController
    def show
        student = Student.find_by(id: params[:id])
        render json: student
    end 
end
