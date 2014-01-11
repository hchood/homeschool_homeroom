class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    unless current_user.is_member_of(@group)
      redirect_to groups_path, notice: "You must be a member to view a group's profile."
    end
    session[:group_id] = @group.id
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_path(@group), notice: 'Success!'
    else
      flash[:notice] = "Sorry, we encountered a problem."
      redirect_to 'new'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :description, :location).merge(organizer: current_user)
  end
end
