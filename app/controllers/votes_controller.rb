class VotesController < ApplicationController

    def show
        vote = Vote.find_by(id: params[:id])
        render json: vote
    end

    def create
        vote = Vote.create(comment_id: params[:comment_id], student_id: params[:student_id], upvote: params[:upvote])
        render json: vote
    end

    def update
        vote = Vote.find_by(id: params[:id])
        vote.update(upvote: params[:upvote])
        render json: vote
    end

    def destroy
        vote = Vote.find_by(id: params[:id])
        vote.destroy
    end

end
