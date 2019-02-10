class SessionsController < ApplicationController
    def create
        @user = User.find_by(name: params[:user][:name])
        if @user.try(:authenticate, params[:user][:password]) == false
            redirect_to users_path
        else
            session[:user_id] = @user.id
            redirect_to homepage_path
        end#if
    end#if
end