class UsersController < ApplicationController
    def show
        @user = current_user
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to @user
        else
            render :new
        end
    end

    def edit
        @user = current_user
    end

    def update
        @user = current_user
        if @user.update(user_params)
            redirect_to @user
        else
            render :edit
        end
    end

    def destroy
        @user = current_user
        @user.destroy
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end
