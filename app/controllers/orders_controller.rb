class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
   before_action :authenticate_user!
  

  
  def sales
    @orders= Order.all.where(seller: current_user).order("created_at DESC")
  end
    
  def purchases
    @orders= Order.all.where(buyer: current_user).order("created_at DESC")
  end

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @listing = Listing.find(params[:listing_id])

    @order.buyer_id = current_user.id
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders, 
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.buyer_id = current_user.id
    @listing = Listing.find(params[:listing_id])
    @seller = @listing.user
    ModelMailer.new_record_notification(@seller.email, @order.detail, current_user.name, @listing.name, @listing.user.name).deliver
    
    @order.listing_id = @listing.id
     @order.buyer_id = current_user.id
     @order.seller_id = @seller.id


      respond_to do |format|
        if @order.save
          format.html { redirect_to root_url, notice: 'Your book request was sent successfully.' }
          format.json { render action: 'show', status: :created, location: @order }
        else
          format.html { render action: 'new' }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:detail)
    end
end
