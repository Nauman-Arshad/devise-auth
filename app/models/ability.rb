# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    if user.super_admin?
      can :manage, :all
    elsif user.admin?
      can [:read, :update], Company, user_id: user.id
      # can :update, Company, user_id: user.id
    end

  end
end
