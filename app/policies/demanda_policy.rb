class DemandaPolicy < ApplicationPolicy
  def index?
    true
  end
  alias create? index?
  alias update? index?
  alias destroy? index?
end