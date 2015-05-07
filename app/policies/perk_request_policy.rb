class PerkRequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    true
  end

  def mask_perk?
    true
  end

  def show?
    record.user == user
  end
  def index?
    true
    record.user == user
  end
end
