class VotesController < ApplicationController
    def create
        vote = Vote.create(comment_id: params[:comment_id], student_id: params[:student_id], upvote: params[:upvote])
        # byebug
        render json: vote
    end

    def update
        vote = Vote.find_by(id: params[:id])
        vote.update(upvote: params[:upvote])
        render json: vote
    end



    # private


    # def vote_params
    #     params.permit(:comment_id, :student_id, :upvote, :vote, :course_id)
    # end
end
