class SearchController < ApplicationController
  
  def search
    @listings = Listing.all.where(is_active: true).where(amazon: false).order("created_at DESC")
end
  
end
