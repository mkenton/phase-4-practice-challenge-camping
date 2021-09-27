class SignupsController < ApplicationController
    def index
        signups = Signup.all
        render json: signup
    end
end
