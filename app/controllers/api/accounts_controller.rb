class Api::AccountsController < ApplicationController
  respond_to :json

  def show
    @account = Account.includes(groups: :pages).find_by_hash_id params[:id]
    respond_with @account
  end
end
