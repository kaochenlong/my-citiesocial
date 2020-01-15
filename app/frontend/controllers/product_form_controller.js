import { Controller } from "stimulus" 

export default class extends Controller { 
  static targets = [ "template", "link" ] 

  add_sku(event) {
    event.preventDefault();

    let content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime());
    this.linkTarget.insertAdjacentHTML('beforebegin', content);
  }
}

