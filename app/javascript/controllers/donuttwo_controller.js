import { Controller } from "@hotwired/stimulus"
import { donuttwo } from "../components/chartstwo";

export default class extends Controller {
  connect() {
    donuttwo()
  }
}
