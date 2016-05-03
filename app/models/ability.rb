class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    if user.role? :admin
      can :manage, :all
    elsif user.role? :guardian
      can :read, Student do |this_student|
        my_houses = [].push user.guardian.household
        my_students = []
        for house in my_houses
          studs = house.students.to_a
          studs.each {|s| my_students.push(s.id)}
        end
        my_students.include? this_student.id
      end
      can :read, Household do |this_household|
        user.guardian.household.id==this_household.id
      end
      can :update, Household do |this_household|
        user.guardian.household.id==this_household.id
      end
      can :read, Guardian do |this_guardian|
        user.guardian.id==this_guardian.id
      end
      can :update, Guardian do |this_guardian|
        user.guardian.id==this_guardian.id
      end
      can :create, Student
      can :create, Household
      can :update, Student do |this_student|
        my_houses = [].push user.guardian.household
        my_students = []
        for house in my_houses
          studs = house.students.to_a
          studs.each {|s| my_students.push(s.id)}
        end
        my_students.include? this_student.id
      end
      can :survey, Household
      can :update, User do |this_user|
        this_user.id == user.id
      end
    elsif user.role? :volunteer
      if user.volunteer.role == "Coach" or user.volunteer.role == "Assistant Coach"
        can :read, Student do |this_student|
          my_students = []
          if not(user.volunteer.team.nil?)
            user.volunteer.team.students.each {|s| my_students.push(s.id)}
          end
          my_students.include? this_student.id
        end
      end
      can :read, Volunteer do |this_volunteer|
        user.volunteer.id = this_volunteer.id
      end
      can :update, Volunteer do |this_volunteer|
        user.volunteer.id = this_volunteer.id
      end
      can :survey, Household
      can :read, Team do |this_team|
        this_team.id == user.volunteer.team_id
      end
      can :update, User do |this_user|
        this_user.id == user.id
      end
    else
      can :create, Household
      # can :read, Household
      can :create, Volunteer
      # can :read, Volunteer
      # can :show, Household
      # can :show, Volunteer
      can :survey, Household
      can :create, User
      can :create, Guardian
    end
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
    # https://github.com/bryanrite/cancancan/wiki/Defining-Abilities
  end
end
