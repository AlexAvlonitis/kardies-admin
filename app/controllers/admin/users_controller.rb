module Admin
  class UsersController < ApplicationController
    def index
      @users = User.page(params[:page]).order(id: :desc)
    end

    def show
      @user = User.find(params[:id])
    end

    def destroy
      user = User.find_by(id: params[:id])
      add_user_to_block_list(user)
      user.destroy
      flash['success'] = 'User has been destroyed'
      redirect_to admin_users_path
    end

    private

    def add_user_to_block_list(user)
      BlockedEmail.create(email: user.email)
    end
  end
end
