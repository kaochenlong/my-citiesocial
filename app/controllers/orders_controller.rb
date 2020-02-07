class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    @order = current_user.orders.build(order_params)

    current_cart.items.each do |item|
      @order.order_items.build(sku_id: item.sku_id, quantity: item.quantity)
    end

    if @order.save
      resp = Faraday.post("#{ENV['line_pay_endpoint']}/v2/payments/request") do |req|
        req.headers['Content-Type'] = 'application/json'
        req.headers['X-LINE-ChannelId'] = ENV['line_pay_channel_id']
        req.headers['X-LINE-ChannelSecret'] = ENV['line_pay_channel_secret']
        req.body = {
          productName: "五百倍大平台", 
          amount: current_cart.total_price.to_i, 
          currency: "TWD", 
          confirmUrl: "http://localhost:3000/orders/confirm", 
          orderId: @order.num
        }.to_json
      end

      result = JSON.parse(resp.body)

      if result["returnCode"] == "0000" 
        payment_url = result["info"]["paymentUrl"]["web"]
        redirect_to payment_url
      else
        flash[:notice] = '付款發生錯誤'
        render 'carts/checkout'
      end
    end
  end

  def confirm
    resp = Faraday.post("#{ENV['line_pay_endpoint']}/v2/payments/#{params[:transactionId]}/confirm") do |req|
      req.headers['Content-Type'] = 'application/json'
      req.headers['X-LINE-ChannelId'] = ENV['line_pay_channel_id']
      req.headers['X-LINE-ChannelSecret'] = ENV['line_pay_channel_secret']
      req.body = {
        amount: current_cart.total_price.to_i, 
        currency: "TWD"
      }.to_json
    end

    result = JSON.parse(resp.body)

    if result["returnCode"] == "0000"
      # 1. 變更 order 狀態
      # 2. 清空購物車
      # redirect_to root_path, notice: '付款已完成'
    else
      redirect_to root_path, notice: '付款發生錯誤'
    end
  end

  private

  def order_params
    params.require(:order).permit(:recipient, :tel, :address, :note)
  end
end
