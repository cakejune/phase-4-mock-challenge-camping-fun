class ActivitiesController < ApplicationController
# rescue_from ActiveRecord::

    def index
        activities = Activity.all 
        render json: activities
    end

    def show
    activity = find_activity
    render json: activity
    end

    def destroy
    activity = find_activity
    if activity
       activity.destroy
       head :no_content
    else 
        render json: { error: "Activity not found" }, status: :not_found
    end
    end

   
    private

    def find_activity
    activity = Activity.find(params[:id])
    end

    def activity_params
    params.permit(:name, :age)
    end
end
