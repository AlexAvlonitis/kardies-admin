module Admin
  class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :show, :update]

    def index
      @users = User.page(params[:page]).order(id: :desc)
    end

    def update
      if @user.update(user_params)
        redirect_to admin_user_path(@user), notice: "Updated"
      else
        redirect_to admin_user_path(@user), alert: @user.errors.full_messages
      end
    end

    def destroy
      user = User.find_by(id: params[:id])
      add_user_to_block_list(user)
      user.destroy
      flash['success'] = 'User has been destroyed'
      redirect_to admin_users_path
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(
        :username,
        :email,
        user_detail_attributes: [
          :gender,
          :state,
          :age
        ]
      )
    end

    def add_user_to_block_list(user)
      BlockedEmail.create(email: user.email)
    end
  end
end
