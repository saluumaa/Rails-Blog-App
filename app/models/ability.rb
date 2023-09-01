# frozen_string_literal: true

# class Ability
#   include CanCan::Ability

#   def initialize(user)

#     can :show, Post
#     can :index, Post
    
#     return unless user.present?

#     can :new, Post, author_id: user.id
#     can :show, Post, author_id: user.id
#     can :create, Post, author_id: user.id
#     can :destroy, Post, author_id: user.id

#     can :create, Comment, author_id: user.id
#     can :destroy, Comment, author_id:user.id

#     return unless user.role === 'admin'

#     can :destroy, :Post
#     can :destroy, :Comment
#   end
# end

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, Post
    can :read, Comment

    if user.admin?
      can :manage, :all # Admin can manage all resources
    else
      can :manage, Post, author_id: user.id
      can :manage, Comment, author_id: user.id
    end
  end
end

