class UsersController < ApplicationController
    before_action :set_user , only:[:favo]
    
    def new
        unless logged_in?
          @user = User.new
        else
          redirect_to root_path,notice:'すでにログインしています。'
        end
    end
    
    def favo
        @favorites_blogs = @user.favorite_blog
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to user_path(@user.id)
        else
            render 'new'
        end
    end
    
    def show
        @user = User.find(params[:id])
    end
    
    private
    def user_params
        params.require(:user).permit(:name, :email, :password,
                                     :password_confirmation)
    end
    
    def set_user
        @user = User.find_by(id: params[:id])
    end
end