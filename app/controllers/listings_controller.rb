
class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_filter :check_user, only: [:edit, :update, :destroy]

  
def seller
    @listings = Listing.where(user: current_user).where(is_active: true).order("created_at DESC")
  end
  
  # GET /listings
  # GET /listings.json
  def index
    if params[:search]
      @listings = Listing.search(params[:search]).order("created_at DESC")
      # search = PgSearch.multisearch(params[:search])
      # @listings = search.map(&:searchable).paginate(:page => params[:page], :per_page => 12)
    else
      @listings = Listing.all.where(is_active: true).where(amazon: false).order("created_at DESC")
    end
     
   
   end

  # GET /listings/1
  # GET /listings/1.json
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.is_active = true
    @listing.user_id = current_user.id
    if(@listing.amazon!=true)
      @listing.amazon= false
    end
    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.update(is_active: false)
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'This Book has been marked as sold!' }
      format.json { head :no_content }
    end
  end
  
  def import
    Listing.import(params[:file])
    redirect_to listings_path, notice: "Listing created successfully"
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:name, :author, :price, :condition, :course, :image)
    end
    
  def check_user
    if current_user != @listing.user
      redirect_to root_url, alert: "Sorry, this listing belongs to someone else"\
      end
  end
  
  
  
end
