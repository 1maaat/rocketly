class ChallengePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(status: 'in_progress' || 'vote' || 'ended')
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def selected?
    true
  end
end
