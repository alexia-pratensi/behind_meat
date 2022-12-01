import { Controller } from "@hotwired/stimulus"
import { donut } from "../components/charts"

export default class extends Controller {
  connect() {
    donut();
  }
}
