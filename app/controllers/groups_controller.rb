class GroupsController < ApplicationController
  def index
    groups = Group.all
    render json: groups
  end

  def show
    group = Group.find(params[:id])
    render json: {
      group: group,
      group_users: group&.users
    }
  end

  def create
    group = Group.new(group_params)

    if group.save
      render json: group, status: :created
    else
      render json: group.errors, status: :unprocessable_entity
    end
  end

  def add_user
    group = Group.find(params[:id])
    user = User.find(params[:user_id])

    if group.users.include?(user)
      render json: { error: "User already in the group" }, status: :unprocessable_entity
    else
      group.users << user
      render json: group
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
