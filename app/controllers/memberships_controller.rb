class MembershipsController < ApplicationController
  def create
    @membership = Membership.new(member: current_user, group: params[:group])
    if @membership.save
    else
    end
  end
end
