class SurveysController < ApplicationController

    def index 
        @surveys = Survey.all
        render json: @surveys
    end

    def create 
        @survey = Survey.create(name: params[:name], user_id: params[:user_id])
        i = 0
        while i < params[:questions].length do
            @question = Question.create(content: params[:questions][i][:content], survey_id: @survey.id)
            @answer1 = Answer.create(content: params[:questions][i][:answers][0][:content], total: 0, question_id: @question.id)
            @answer2 = Answer.create(content: params[:questions][i][:answers][1][:content], total: 0, question_id: @question.id)
            @answer3 = Answer.create(content: params[:questions][i][:answers][2][:content], total: 0, question_id: @question.id)
            @answer4 = Answer.create(content: params[:questions][i][:answers][3][:content], total: 0, question_id: @question.id)
            @answer5 = Answer.create(content: params[:questions][i][:answers][4][:content], total: 0, question_id: @question.id)
            i += 1
        end
        render json: @survey
    end

    def destroy
        @survey = Survey.find_by(id: params[:id])
        @survey.favorites.destroy_all
        @survey.user_survey_joiners.destroy_all
        @survey.questions.destroy_all
        @survey.destroy
        render json: {success: "Destroyed"}
    end

end
