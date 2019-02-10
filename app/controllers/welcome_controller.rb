class WelcomeController < ApplicationController
    def show
        @user = session[:user_id]
    end
end