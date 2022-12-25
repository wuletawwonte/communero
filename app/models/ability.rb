class Ability
  include CanCan::Ability

  def initialize(_user)
    can :create, Group
    can :manage, Group
    can :manage, Member
    can :manage, Post
    can :manage, Comment
    can :manage, SubComment
  end
end
