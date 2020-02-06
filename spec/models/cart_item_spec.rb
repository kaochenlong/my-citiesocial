require 'rails_helper'

RSpec.describe CartItem, type: :model do
  let(:cart) { Cart.new }

  it "每個 Cart Item 都可以計算它自己的金額（小計）" do
    p1 = create(:product, :with_skus, sell_price: 5)
    p2 = create(:product, :with_skus, sell_price: 10)

    3.times { cart.add_sku(p1.skus.first.id) }
    2.times { cart.add_sku(p2.skus.first.id) }

    expect(cart.items.first.total_price).to eq 15
    expect(cart.items.last.total_price).to eq 20
  end
end
