class ProductsController < ApplicationController
  def index
    @products = Product.order(updated_at: :desc).includes(:vendor)
  end

  def show
  end
end
