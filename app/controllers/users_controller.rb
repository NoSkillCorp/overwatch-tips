class UsersController < ApplicationController
    def show
        @tips = Tip.where(user: @user).order(created_at: :desc)
    end
end