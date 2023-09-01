# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    can :show, Post
    can :index, Post
    
    return unless user.present?

    can :new, Post, author_id: user.id
    can :create, Post, author_id: user.id
    can :destroy, Post, author_id: user.id

    can :create, Comment, author_id: user.id
    can :destroy, Comment, author_id:user.id

    return unless user.role === admin

    can :destroy, :Post
    can :destroy, :Comment
  end
end
