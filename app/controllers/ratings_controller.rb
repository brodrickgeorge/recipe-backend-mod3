class RatingsController < ApplicationController
    
    def show
        find_rating
        render json: find_rating, except: [:created_at, :updated_at]
    end

    def new 
        rating = Rating.new
    end

    def create 
        rating = Rating.new(rating_params)
        if rating.save
            render json: rating, except: [:created_at, :updated_at]
        end
    end

    def edit 
        find_rating
    end

    def update
        find_rating.update(rating_params)
        render json: find_rating, except: [:created_at, :updated_at]
    end

    def destroy
        find_rating.destroy
    end

    private 

    def find_rating
        rating = Rating.find(params[:id])

    end

    def rating_params
        params.require(:offer).permit(:rating, :user_id, :recipe_id)
    end

end
