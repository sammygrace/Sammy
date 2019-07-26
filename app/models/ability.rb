class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      can :read, Vendor
      can :manage, Vendor, user_id: user.id
    else
      can :read, Vendor
    end
  end
end
