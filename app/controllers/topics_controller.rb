class TopicsController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to group_path(@topic.group), notice: "Your topic was posted!"
    else
      flash[:notice] = "Uh oh! We encountered a problem."
      redirect_to groups_path
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :description).merge(author_id: current_user.id).merge(group_id: params[:group_id])
  end
end
