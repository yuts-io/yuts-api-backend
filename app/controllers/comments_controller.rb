class CommentsController < ApplicationController

    def show
        comment = Comment.find_by(id: params[:id])
        render json: comment, include: [:votes]
    end 

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

    def changeVotes
        comment = Comment.find_by(id: params[:id])
        comment.update(vote_score: params[:vote_score])
        render json: comment
    end

    
    private


    def comment_params
        params.permit(:id, :student_id, :content, :comment_id, :vote_score, :comment)
    end
end
