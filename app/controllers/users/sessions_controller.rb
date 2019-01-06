# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def create
    super do
      sign_out(resource) unless resource.admin?
    end
  end
end
