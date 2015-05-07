class PerkPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def update?
    true
  end

  def search?
    true
  end
end
