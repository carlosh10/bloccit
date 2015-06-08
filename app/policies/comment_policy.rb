class CommentPolicy < ApplicationPolicy

  def create?
    #you want to arrive at a true or false outocome, and treturn that value
    user.present? 
  end

  def new?
    user.present? 
  end

end
