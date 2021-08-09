class CommentsController < ApplicationController

    def create
        comment = Comment.create(comment_params)
        render json: comment
    end

    def update
        
        comment = Comment.find_by(id: params[:id])
        # byebug
        comment.update(content: params[:comment][:content])
        render json: comment
    end

    def destroy
        comment = Comment.find_by(id: params[:id])
        comment.destroy
    end

    
    private


    def comment_params
        params.permit(:id, :student_id, :content, :course_id, :vote_score, :comment)
    end
end
