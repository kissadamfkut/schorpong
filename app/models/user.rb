class User < ApplicationRecord
  has_many :memberships

  def admin?
    self.admin
  end

  def membership_for(team)
    memberships.find { |m| m.team == team }
  end

  def team_admin?
    memberships.find { |m| m.admin? }
  end

  def admin_of?(team)
    membership = membership_for(team)
    membership&.admin?
  end

  def member_of?(team)
    membership = membership_for(team)
    membership&.active?
  end

  def can_create_team?
    self.number_of_memberships == 0
  end

  def number_of_memberships
    memberships.size
  end
end
