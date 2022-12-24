class Ability
  include CanCan::Ability

  def initialize(user)
    can :create, Group
    can :manage, Group, user
    can :manage, Member
    can :manage, Post
    can :manage, Comment
    can :manage, SubComment
  end
end
