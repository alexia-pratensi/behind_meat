// Entry point for the build script in your package.json
// import "@hotwired/turbo-rails"
import "./controllers"

import {meatQuantity} from './components/meat_quantity'
import { donut } from "./components/charts";

import { animalsDeath } from "./components/animals_death";
import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
// import { donuttwo } from "./components/chart";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

document.addEventListener("turbolinks:load", function () {
  meatQuantity()
  donut()
  // animalsDeath()
});
