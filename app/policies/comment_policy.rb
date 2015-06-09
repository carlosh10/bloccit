class CommentPolicy < ApplicationPolicy

  def create?
    #you want to arrive at a true or false outocome, and treturn that value
    user.present? 
  end

  def new?
    user.present? 
  end

  def destroy?
    user.present? && (record.user == user || user.admin? || user.moderator?)
  end
end
