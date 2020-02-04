import { Controller } from "stimulus" 
import Rails from "@rails/ujs"

export default class extends Controller { 
  static targets = [ "quantity", "sku", "addToCartButton" ] 

  add_to_cart(evt) {
    evt.preventDefault();

    let product_id = this.data.get("id");
    let quantity = this.quantityTarget.value;
    let sku = this.skuTarget.value;

    if (quantity > 0) {
      this.addToCartButtonTarget.classList.add('is-loading');
      let data = new FormData();
      data.append("id", product_id);
      data.append("quantity", quantity);
      data.append("sku", sku);

      Rails.ajax({
        url: "/api/hello", 
        data, 
        type: "POST",
        success: respo => {
        }, 
        error: err => {
        }
      });
    }
  }

  quantity_minus(evt) {
    evt.preventDefault();
    let q = Number(this.quantityTarget.value);
    if (q > 1) {
      this.quantityTarget.value = q - 1;
    }
  }

  quantity_plus(evt) {
    evt.preventDefault();
    let q = Number(this.quantityTarget.value);
    this.quantityTarget.value = q + 1;
  }
}

