class PagesController < ApplicationController

  def home
    @products = Product.page params[:page]
  end

  def show
  end
end
