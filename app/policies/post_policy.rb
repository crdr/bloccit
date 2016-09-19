class PostPolicy < ApplicationPolicy
class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
        @user = user
        @scope = scope
    end
    
    def resolve
        if user.admin?
            scope.all
        elsif user.moderator?
            scope.all
        elsif user.member?
            scope.where(user: member)
        elsif user.guest?
            scope.where()
        else
            scope.where(published: true)
        end
    end
end    
    def index?
        true
    end
end  
