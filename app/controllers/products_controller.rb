class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  include Filterable
  # GET /products or /products.json
  def index
    if params["filter"]
      @products = Company.find(params["filter"]).products
    elsif params["search"]
      @filter = params["search"]["company"].concat(params["search"]["strengths"]).flatten.reject(&:blank?)
      @products = Product.all.global_search("#{@filter}")
    else
      @products = Product.all
    end
    respond_to do |format|
      format.html
      format.js
    end  
  end

  def list
    products = filter!(Product)
    render(partial: 'product', locals: { products: products })
  end

  # GET /products/1 or /products/1.json
  def show
    @product = Product.find(params[:id])
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :filter, :title, :discription, :price, :image_path, :company_id)
    end

    def filter_params
      params.permit(:name, :title, :price)
    end
end
