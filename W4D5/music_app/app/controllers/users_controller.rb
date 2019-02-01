class UsersController < ApplicationController
    
    def new 
        render :new
    end

    def create
        @user = User.new(email: params[:user][:email], password: params[:user][:password])
        if @user.save
            login!(@user)
            redirect_to user_url(@user.id)
        else
            flash[:errors] = ["Account cannot be created"]
            redirect_to new_user_url
        end
    end

    def show
        @user = current_user
        render :show
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end

end
