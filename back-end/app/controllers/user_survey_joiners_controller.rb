class UserSurveyJoinersController < ApplicationController

    def index 
        user_survey_joiners = UserSurveyJoiner.all
        render json: user_survey_joiners
    end

    def create
        @user_survey_joiner = UserSurveyJoiner.create(user_id: params[:user_id], survey_id: params[:survey_id])
        render json: @user_survey_joiner
    end

end
