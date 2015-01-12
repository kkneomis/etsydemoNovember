class SearchController < ApplicationController
  
  def search
    @listings = Listing.all.where(is_active: true)
end
  
end
