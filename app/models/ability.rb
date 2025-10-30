class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new(role: :regular) # Usuario invitado o sin sesión

    if user.admin?
      # Los administradores pueden hacer cualquier cosa
      can :manage, :all

    elsif user.regular?
      # Usuarios normales
      can :read, Recipe
      can :create, Recipe
      can [:update, :destroy], Recipe, user_id: user.id

    else
      # Visitantes no autenticados
      can :read, Recipe
    end
  end
end
