class SessionsController < ApplicationController
    def create
        # @user = User.find_by(name: params[:user][:name])
        # if !@user.try(:authenticate, params[:user][:password]).nil?
        #     if params[:user][:password] != @user.password
        #         redirect_to users_path
        #     else
        #         session[:user_id] = @user.id
        #         redirect_to homepage_path
        #     end#if
        # end#if
        @user = User.find_by(name: params[:user][:name])
        @user = @user.try(:authenticate, params[:user][:password])
        if !@user
            redirect_to users_path
        else
            session[:user_id] = @user.id
            redirect_to homepage_path
        end
    end#create
end