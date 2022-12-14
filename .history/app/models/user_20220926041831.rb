class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self
  has_many :companies
  def jwt_payload
  super
  end

  ROLES = %w{super_admin admin manager}

  ROLES.each do |role_name|
    define_method "#{role_name}?" do
      role == role_name
    end
  end

  # def super_admin?
  #   role == 'super_admin'
  # end

  # def admin?
  #   role == 'admin'
  # end

  # def manager?
  #   role == 'manager'
  # end

end

