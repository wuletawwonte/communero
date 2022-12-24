# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      can :create, Group
      can :manage, Group, user: user
      can :manage, Member
      can :manage, Post
      can :manage, Comment
      can :manage, SubComment
    end
  end
end
