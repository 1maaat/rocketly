function initArtworkform() {
  const steps = Array.from(document.querySelectorAll(".step"));
  const nextBtn = document.querySelectorAll("form .next-btn");
  const prevBtn = document.querySelectorAll("form .previous-btn");
  const form = document.querySelector('form');

  nextBtn.forEach((button) => {
    button.addEventListener("click", (e) => {
      e.preventDefault();
      changeStep("next");
    });
  });
  prevBtn.forEach((button) => {
    button.addEventListener("click", (e) => {
      e.preventDefault();
      changeStep("prev");
    });
  });

  form.addEventListener("submit", (e) => {
    e.preventDefault();
    const inputs = [];
    form.querySelectorAll("input").forEach((input) => {
      const { name, value } = input;
      inputs.push({ name, value });
    });
    console.log(inputs);
    form.reset();
  });

  function changeStep(button) {
    let index = 0;
    const active = document.querySelector(".stepactive");
    index = steps.indexOf(active);
    steps[index].classList.remove("stepactive");
    if (button === "next") {
      index ++;
    } else if (button === "prev") {
      index --;
    }
    steps[index].classList.add("stepactive");
  }
}

export { initArtworkform };