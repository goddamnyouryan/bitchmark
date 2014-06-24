class Api::PagesController < PagesController
  respond_to :json
  skip_before_filter :verify_authenticity_token

  def create
    @account = Account.find_by(hash_id: params[:page].delete(:account_hash_id))
    @page = Page.create page_params
    if @page.save
      respond_with @page
    end
  end

  def destroy
  end
end
