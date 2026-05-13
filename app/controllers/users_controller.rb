class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @upcoming_hosted = @user.hosted_events.upcoming
        @past_hosted = @user.hosted_events.past
        @upcoming_attended = @user.attended_events.upcoming
        @past_attended = @user.attended_events.past
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
        params.require(:user).permit(:username, :email, :password)
    end
end
