class AnswersController < ApplicationController

    def index 
        answers = Answer.all
        render json: answers
    end

    def update
        answer = Answer.find_by(id: params[:id])
        answer.update(total: params[:total])
        # answers = {total: answer.total}
        render json: answer
        # render json: {answers: answers}, status: :accepted
    end

    private
    def total_params
        params.permit(:id, :content, :total)
    end


end
