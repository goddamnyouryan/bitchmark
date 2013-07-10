class AccountsController < ApplicationController
  def create
    @account = Account.create
    redirect_to "/#{@account.hash_id}"
  end

  def show
    @account = Account.find_by_hash_id params[:hash_id]
    @page = Page.new
    @options = options_for_new_site_select
  end

  def destroy
  end

  private

  def options_for_new_site_select
    @groups = @account.groups.map {|group| [group.title, group.id] }
    @groups + [['New Group', 'new'], ['Fuckit, don\'t group it', '']]
  end
end
