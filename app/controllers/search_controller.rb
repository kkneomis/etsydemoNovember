class SearchController < ApplicationController
  
  def search

      @listings = Listing.search(params[:q]).records.where(is_active: true).order(:price).paginate(:page => params[:page], :per_page => 16)
  
end
  
end
