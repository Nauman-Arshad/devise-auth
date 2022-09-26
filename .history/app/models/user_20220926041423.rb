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


  def super_admin?
    role == 'super_admin'
  end

  def admin?
    role == 'admin'
  end

  def manager?
    role == 'manager'
  end

end

