class SearchController < ApplicationController
  
  def search
    @listings = Listing.all.where(is_active: true).order("created_at DESC")
end
  
end
