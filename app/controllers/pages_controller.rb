class PagesController < ApplicationController
  def about
  end

  def contact
  end
  
  def home
    @user=current_user
    @listings = Listing.where(user: current_user).where(is_active: true).order("created_at DESC")
  end
  
  
end
