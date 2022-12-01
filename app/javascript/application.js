// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
import { donut } from "./components/charts"
import { meatQuantity } from "./components/meat_quantity"

donut();

meatQuantity();
