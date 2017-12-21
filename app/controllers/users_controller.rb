class UsersController < ApplicationController
    
    def new
        @user = User.new
    end
    
    def create
        
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end
    
    def show
        if params[:id].to_i == session[:user_id]
            @user = User.find(params[:id])
        else
            redirect_to '/'
        end
    end
    
    private
    
    def user_params
    params.require(:user).permit(:name, :height, :happiness, :tickets, :nausea, :password, :password_confirmation, :admin)
    end
    
end
