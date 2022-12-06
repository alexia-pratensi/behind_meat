// Entry point for the build script in your package.json
// import "@hotwired/turbo-rails"
import "./controllers"
// import "bootstrap"

// export default class extends Controller {
//   connect() {
//     donut();
//   }
// }
// console.log('appli');

import {meatQuantity} from './components/meat_quantity'
import { donut } from "./components/charts";
import { animalsDeath } from "./components/animals_death";
import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

document.addEventListener("turbolinks:load", function () {
  meatQuantity()
  donut()
  // animalsDeath()
});
