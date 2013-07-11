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

  def sort
    params[:group].each_with_index do |id, index|
      Group.update_all({position: index + 1}, { id: id })
    end
    render nothing: true
  end

  private

  def find_group
    @group = Group.includes(:account, :pages).find_by_hash_id params[:id]
  end
end
