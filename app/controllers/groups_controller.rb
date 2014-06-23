class GroupsController < ApplicationController
  before_filter :find_group

  def show
  end

  def destroy
    @group.destroy
    redirect_to root_url
  end

  private

  def find_group
    @group = Group.find_by(hash_id: params[:id])
  end
end
