class SearchController < ApplicationController
  
  def search
    @listings = Listing.search(params[:q]).records
end
  
end
