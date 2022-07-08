class ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show edit update destroy ]
  before_action :authenticate_user! 
  # GET /reviews or /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1 or /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews or /reviews.json
  def create
    @product = Product.find(params[:product_id])
    @review = Review.new(content: review_params['content'],
     user_id: current_user.id, product_id: @product.id)
    respond_to do |format|
      if @review.save
        format.html { redirect_to @product, notice: "Review was successfully created." }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { redirect_to @product, notice:  "Review was not created"}
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to review_url(@review), notice: "Review was successfully updated." }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    @review.destroy

    respond_to do |format|
      format.html { redirect_to reviews_url, notice: "Review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:content, :product_id)
    end
end



# class ReviewsController < ApplicationController
#   before_action :find_commentable, only: :create
  
#       def new
#         @review = Review.new
#       end
  
#       def create
#         @commentable.reviews.build(review_params)
#         @commentable.save
#       end
  
#       private
  
#       def review_params
#         params.require(:review).permit(:content)
#       end
  
#       def find_commentable
#         if params[:review_id]
#           @commentable = Review.find_by_id(params[:review_id]) 
#         elsif params[:product_id]
#           @commentable = Product.find_by_id(params[:product_id])
#         end
#       end
  
#   end