module Admin
  class UsersController < ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = User.
    #     page(params[:page]).
    #     per(10)
    # end

    def destroy
      user = User.find_by(id: params[:id])
      add_user_to_block_list(user)
      user.destroy
      flash['success'] = 'User has been destroyed'
      redirect_to admin_users_path
    end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   User.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information

    private

    def add_user_to_block_list(user)
      BlockedEmail.create(email: user.email)
    end
  end
end