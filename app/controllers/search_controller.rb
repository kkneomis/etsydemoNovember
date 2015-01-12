class SearchController < ApplicationController
  
  def search
    @listings = Listing.search(params[:q]).records.where(is_active: true)
end
  
end
