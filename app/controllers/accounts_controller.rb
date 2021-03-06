class AccountsController < ApplicationController
  def create
    @account = Account.create
    redirect_to "/#{@account.hash_id}"
  end

  def show
    @account = Account.find_by_hash_id params[:hash_id]
    cookies[:bitchmark_account] = {value: @account.hash_id, expires: 1.year.from_now }
  end

  def destroy
  end
end
