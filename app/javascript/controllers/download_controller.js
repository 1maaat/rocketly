import { Controller } from "stimulus";
import { csrfToken } from "@rails/ujs";

export default class extends Controller {
  static targets = ["dlbutton"]

  connect() {
    console.log("Hello")
  }

  download(event) {
    console.log("Hello!")
  }
}
