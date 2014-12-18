class PagesController < ApplicationController
  def about
  end

  def contact
  end
  
  def home
    @user=current_user
    @listings = Listing.where(user: current_user).where(is_active: true).order("created_at DESC")
  end
  
  def terms
  end
  
  def privacy
  end
  
  def getting_started
  end
  
end
