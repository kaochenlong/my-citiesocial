require 'rails_helper'

RSpec.describe Cart, type: :model do
  context "基本功能" do
    it "可以把商品丟到到購物車裡，然後購物車裡就有東西了" do
      # AAA = Arrange, Act, Assert
      cart = Cart.new
      cart.add_item(2)
      expect(cart.empty?).to be false
    end

    it "加了相同種類的商品到購物車裡，購買項目（CartItem）並不會增加，但商品的數量會改變" do
      cart = Cart.new

      3.times { cart.add_item(1) }
      2.times { cart.add_item(2) }

      expect(cart.items.count).to be 2
      expect(cart.items.first.quantity).to be 3
    end

    it "商品可以放到購物車裡，也可以再拿出來" do
      cart = Cart.new
      # v1 = Vendor.create(title: 'v1')
      # p1 = Product.create(name: 'kk', list_price: 10, sell_price: 5, vendor: v1)
      p1 = FactoryBot.create(:product)

      cart.add_item(p1.id)

      expect(cart.items.first.product).to be_a Product
    end
  end

  context "進階功能" do
  end
end
