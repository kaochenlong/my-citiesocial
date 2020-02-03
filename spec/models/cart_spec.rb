require 'rails_helper'

RSpec.describe Cart, type: :model do
  context "基本功能" do
    it "可以把商品丟到到購物車裡，然後購物車裡就有東西了" do
      # AAA = Arrange, Act, Assert
      cart = Cart.new
      cart.add_item(2)
      expect(cart.empty?).to be false
    end
  end

  context "進階功能" do
  end
end
