# == Schema Information
#
# Table name: admin_app_admins
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  first_name             :string
#  last_name              :string
#  role                   :string           default("admin")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_admin_app_admins_on_confirmation_token    (confirmation_token) UNIQUE
#  index_admin_app_admins_on_email                 (email) UNIQUE
#  index_admin_app_admins_on_reset_password_token  (reset_password_token) UNIQUE
#  index_admin_app_admins_on_unlock_token          (unlock_token) UNIQUE
#

module AdminApp
  class Admin < ActiveRecord::Base
    include Names

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable, :confirmable,
           :recoverable, :rememberable, :trackable, :validatable, :lockable
  end
end
