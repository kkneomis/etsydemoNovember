class SearchController < ApplicationController
  
  def search
    @listings = Listing.all.where(is_active: true).where(amazon: false).paginate(:page => params[:page], :per_page => 12)
end
  
end
