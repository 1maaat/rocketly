import { Controller } from "stimulus";
import { csrfToken } from "@rails/ujs";
import Swal from "sweetalert2";
import confetti from 'canvas-confetti';

export default class extends Controller {
  static targets = ["form", "finalSlide", "slide"]
  connect() {
    console.log(this.finalSlideTarget);
  }

  send(event) {
    event.preventDefault();
    showConfirmationConfettiDialog()
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
      this.finalSlideTarget.innerHTML = data.sharehtml;
    });

  };
}

function showConfirmationConfettiDialog() {
  confettiAnimation()
  Swal.fire({
    toast: true,
    position: 'top',
    title: "🎉 Well done, thank's for your contribution !🎉",
    timer: 2000,
    showConfirmButton: false,
    padding: '3em',
    backdrop: `
    rgba(0,0,123,0.1)
    left top
    no-repeat
    `
  });
};
function confettiAnimation() {
  // var duration = 3 * 1000;
  // var animationEnd = Date.now() + duration;
  // var defaults = { startVelocity: 30, spread: 360, ticks: 60, zIndex: -100 };

  // function randomInRange(min, max) {
  //   return Math.random() * (max - min) + min;
  // }

  // var interval = setInterval(function () {
  //   var timeLeft = animationEnd - Date.now();

  //   if (timeLeft <= 0) {
  //     return clearInterval(interval);
  //   }

  //   var particleCount = 25 * (timeLeft / duration);
  //   // since particles fall down, start a bit higher than random
  //   confetti(Object.assign({}, defaults, { particleCount, origin: { x: randomInRange(0.1, 0.3), y: Math.random() - 0.2 } }));
  //   confetti(Object.assign({}, defaults, { particleCount, origin: { x: randomInRange(0.7, 0.9), y: Math.random() - 0.2 } }));
  // }, 250);


  var end = Date.now() + (1 * 100);

  // go Buckeyes!
  var colors = ['#562877', '#533CF0'];

  (function frame() {
    confetti({
      particleCount: 70,
      angle: 60,
      spread: 200,
      origin: { x: 0 },
      colors: colors,
      zIndex: 100000000000
    });
    confetti({
      particleCount: 70,
      angle: 120,
      spread: 200,
      origin: { x: 1 },
      colors: colors,
      zIndex: 100000000000
    });

    if (Date.now() < end) {
      requestAnimationFrame(frame);
    }
  }());

  function randomInRange(min, max) {
    return Math.random() * (max - min) + min;
  }

  confetti({
    angle: randomInRange(105, 125),
    spread: randomInRange(5000, 7000),
    particleCount: randomInRange(60, 90),
    origin: { y: 0.6 },
    zIndex: 100000000000
  });

  confetti({
    angle: randomInRange(55, 75),
    spread: randomInRange(5000, 7000),
    particleCount: randomInRange(60, 90),
    origin: { x: 0.5 },
    zIndex: 100000000000
  });
};
