class User < ApplicationRecord
  devise :database_authenticatable
  paginates_per 50

  has_one  :about,                      dependent: :destroy
  has_one  :user_detail,                dependent: :destroy
  has_one  :email_preference,           dependent: :destroy
  has_one  :gallery,                    dependent: :destroy
  has_many :reports,                    dependent: :destroy
  has_many :search_criteria,            dependent: :destroy
  has_many :vote_notifications,         dependent: :destroy
  has_many :blocked_users,              dependent: :destroy
  has_many :pictures, through: :gallery
  has_many :oauth_access_tokens,
           foreign_key: :resource_owner_id,
           dependent: :delete_all

  accepts_nested_attributes_for :user_detail
end
