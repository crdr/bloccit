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
            scope.
        elsif user.guest?
            scope.
        else
            scope.where(published: true)
        end
    end
end    
    def index?
        true
    end
end  
