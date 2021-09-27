class ActivitiesController < ApplicationController

    def index
        activities = Activity.all
        render json: activities
    end

    # def show
    #     activity = Activity.find(id: params[:id])
    #     if activity
    #         render json: activity
    #     else
    #         render json: { error : "Activity not found"}, status: :not_found
    #     end
    # end

    def destroy
        activity = Activity.find_by_id(params[:id])
        if activity
            activity.destroy
            head :no_content
        else
            render json: { error: "Activity not found"}, status: :not_found
        end
    end

end

