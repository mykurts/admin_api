# frozen_string_literal: true

class Account::Administrator < ActiveRecord::Base
  self.table_name = 'accounts'
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :validatable
  include DeviseTokenAuth::Concerns::User
  before_validation :generate_uid, unless: proc { |user| user.uid.present? }

  private
    def generate_uid
      new_uid = SecureRandom.uuid.delete('-')
      self.uid = self.class.exists?(uid: new_uid) ? generate_uid : new_uid
    end

end
