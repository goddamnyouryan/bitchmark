class Api::GroupsController < ApplicationController
  respond_to :json
  before_filter :find_group

  def show
    respond_with @group
  end

  def update
    @group.update_attribute :title, params[:title]
    respond_with @group
  end

  def destroy
    @group.destroy
    respond_with @group
  end

  private

  def find_group
    @group = Group.includes(:account, :pages).find_by_hash_id params[:id]
  end
end
