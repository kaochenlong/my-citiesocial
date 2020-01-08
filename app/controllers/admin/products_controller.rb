class Admin::ProductsController < Admin::BaseController
  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    
    if @product.save
      redirect_to admin_products_path, notice: '商品已新增'
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, 
                                    :vendor_id, 
                                    :list_price, 
                                    :sell_price)
  end
end

