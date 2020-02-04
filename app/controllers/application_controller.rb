class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  before_action :find_categories, unless: :backend?
  helper_method :current_cart

  private
  def record_not_found
    render file: "#{Rails.root}/public/404.html", 
           layout: false, 
           status: 404
  end

  def backend?
    controller_path.split('/').first == 'Admin'
  end

  def find_categories
    @categories = Category.order(position: :asc)
  end

  def current_cart
    @cart9527 ||= Cart.from_hash(session[:cart_9527])
  end
end
