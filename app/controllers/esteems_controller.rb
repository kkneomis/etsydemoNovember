class EsteemsController < ApplicationController
  before_action :set_esteem, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @esteems = Esteem.all
    respond_with(@esteems)
  end

  def show
    respond_with(@esteem)
  end

  def new
    @esteem = Esteem.new
    respond_with(@esteem)
  end

  def edit
  end

  def create
    @esteem = Esteem.new(esteem_params)
    @esteem.save
    ModelMailer.value_mail(@esteem.name, @esteem.title, @esteem.condition, @esteem.email, @esteem.comment).deliver
    flash[:notice] = 'We will get back to you shortly with an estimated price' if @esteem.save
    redirect_to root_path
  end

  def update
    @esteem.update(esteem_params)
    respond_with(@esteem)
  end

  def destroy
    @esteem.destroy
    respond_with(@esteem)
  end

  private
    def set_esteem
      @esteem = Esteem.find(params[:id])
    end

    def esteem_params
      params.require(:esteem).permit(:name, :title, :condition, :email, :comment)
    end
end
