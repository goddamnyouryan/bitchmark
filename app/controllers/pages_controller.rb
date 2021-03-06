class PagesController < ApplicationController
  def create
    @account = Account.find_by(hash_id: params[:page].delete(:account_hash_id))
    @page = Page.create page_params
    if @page.save
      redirect_to :back
    end
  end

  def destroy
  end

  private

  def page_params
    page = params[:page]
    page[:group_id] = group_id
    page.delete :group
    page.permit!
  end

  def group_id
    if params[:page][:group] == 'new'
      title = params[:page].delete :new_group
      group = group_find_or_create(@account.id, title)
      group.id
    elsif params[:page][:group] == ''
      group = group_find_or_create(@account.id, 'Not grouped')
      group.id
    else
      params[:page][:group]
    end
  end

  def group_find_or_create(account_id, title)
    group = Group.find_or_initialize_by(account_id: account_id, title: title)
    group.position = 0 if group.new_record?
    group.save
    group
  end
end
