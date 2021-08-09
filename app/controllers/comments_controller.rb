class CommentsController < ApplicationController

    def create
        comment = Comment.create(comment_params)
        render json: comment
    end

    def update
        comment = Comment.find_by(id: params[:id])
        comment.update(comment_params)
        render json: comment
      end

    
    private


    def comment_params
        params.permit(:student_id, :content, :course_id, :vote_score)
    end
end
