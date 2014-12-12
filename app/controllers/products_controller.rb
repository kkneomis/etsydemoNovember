class ProductsController < ApplicationController
  def index
    @products=Product.all
  end

  def import
    begin
    Product.import(params[:file])
    redirect_to products_path, notice: "Products imported"
    rescue
      redirect_to products_path, notice: "Invalid CSV file format"
    end
  end
end
