class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    unless current_user.is_member_of(@group)
      redirect_to groups_path, notice: "You must be a member to view a group's profile."
    end
  end
end
