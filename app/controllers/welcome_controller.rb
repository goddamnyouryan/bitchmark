class WelcomeController < ApplicationController
  def index
    cookie = cookies[:bitchmark_account]
    if cookie.present?
      redirect_to "/#{cookie}"
    end
  end
end
