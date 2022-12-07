import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="counter-animals"
export default class extends Controller {
  connect() {
    console.log('coucou');
  }
}
