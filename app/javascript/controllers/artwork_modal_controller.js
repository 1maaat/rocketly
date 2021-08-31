import { Controller } from "stimulus";
import { csrfToken } from "@rails/ujs";
// [...]

export default class extends Controller {
  static targets = ["form", "finalSlide", "slide"]
  connect() {
    console.log("hello");
    console.log(this.finalSlideTarget);
  }

  send(event) {
    event.preventDefault();
    fetch(this.formTarget.action, {
      method: 'POST',
      headers: { 'Accept': "application/json", 'X-CSRF-Token': csrfToken() },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        this.slideTargets.forEach((slide) => {
          slide.classList.remove("stepactive")
        });
        this.finalSlideTarget.classList.add("stepactive");
        console.log()
        this.finalSlideTarget.innerHTML = data.sharehtml;
      });
  };
}
