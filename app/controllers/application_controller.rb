class ApplicationController < ActionController::Base
	include PublicActivity::StoreController
  protect_from_forgery
  before_filter :authenticate_user!

	
end
