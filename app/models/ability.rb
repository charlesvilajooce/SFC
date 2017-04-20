class Ability
  include CanCan::Ability

  def initialize(user)



    # can :sign_in, User
    user ||= User.new
    if user.canrole == 'admin' || user.canrole == 'staff'
      can :manage, :all
      # can :index, :all
      # can :index, Event
    elsif user.canrole == 'premiere' || user.canrole == 'm21' || user.canrole == 'm20' || user.canrole == 'm18' || user.canrole == 'm16' || user.canrole == 'm14'
      can :show , User do |u|
          u.id == user.id
      end
      can :manage , User do |u|
        u.id == user.id
      end
      if user.canrole == 'premiere' || user.isadmin()
        can :index , Event
        can :show , Event
        can :showpartial , Event
        can :eventsource , Event
        can :manage , Calendar
      end
      # can :index , Event
      # can :manage, :all
    elsif user.canrole == 'undefined'
      can :manage , User do |u|
        u.id == user.id
      end
    else

      # can :manage, :all
    end



    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
