class FavoritesController < ApplicationController

    def index 
        @favorites = Favorite.all
        render json: @favorites
    end

    def create
        @favorite = Favorite.create(user_id: params[:user_id], survey_id: params[:survey_id])
        render json: @favorite
    end

    def show
        favorite = Favorite.find_by(id: params[:id])
        render json: favorite
    end

    def destroy
        # byebug
        favorite = Favorite.find_by(id: params[:id])
        favorite.destroy
        render json: {success: "Destroyed"}
    end

end
