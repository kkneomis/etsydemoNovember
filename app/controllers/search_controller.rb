class SearchController < ApplicationController
  
  def search
      @listings = Listing.search(params[:q]).records.where(is_active: true).paginate(:page => params[:page], :per_page => 16).order(:amazon).order(:name)
  
end
  
end
