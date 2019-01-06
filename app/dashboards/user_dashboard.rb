require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    username: Field::String,
    email: Field::String,
    reset_password_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    last_sign_in_at: Field::DateTime,
    last_sign_in_ip: Field::String,
    is_signed_in: Field::Boolean,
    admin: Field::Boolean,
    deleted_at: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    confirmation_token: Field::String,
    confirmed_at: Field::DateTime,
    confirmation_sent_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :username,
    :email
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :username,
    :email,
    :reset_password_token,
    :reset_password_sent_at,
    :last_sign_in_at,
    :last_sign_in_ip,
    :is_signed_in,
    :admin,
    :deleted_at,
    :created_at,
    :updated_at,
    :confirmation_token,
    :confirmed_at,
    :confirmation_sent_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :username,
    :email,
    :reset_password_token,
    :is_signed_in,
    :admin,
    :deleted_at,
    :confirmed_at,
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
