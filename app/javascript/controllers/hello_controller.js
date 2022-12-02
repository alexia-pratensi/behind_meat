import { Controller } from "@hotwired/stimulus"
import { meatQuantity } from "../components/meat_quantity"

export default class extends Controller {
  connect() {
    meatQuantity();
  }
}
