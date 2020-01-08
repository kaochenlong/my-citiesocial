class Admin::ProductsController < Admin::BaseController
  def index
  end

  def new
    @product = Product.new
  end
end

