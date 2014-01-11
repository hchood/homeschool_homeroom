class MembershipsController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @membership = Membership.new(member: current_user, group: @group)
    if @membership.save
      redirect_to group_path(@group), notice: "Welcome to #{@group.name}!"
    else
      flash.now[:notice] = "Sorry, we encountered an error."
      redirect_to groups_path
    end
  end
end
