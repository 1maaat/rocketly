function initArtworkform() {
  const steps = Array.from(document.querySelectorAll(".step"));
  const nextBtn = document.querySelectorAll("form .next-btn");
  const prevBtn = document.querySelectorAll("form .previous-btn");
  const submitBtn = document.querySelectorAll("form .submit-btn");

  // const form = document.querySelector('form');

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
  submitBtn.forEach((button) => {
    button.addEventListener("click", (e) => {
      // e.preventDefault();
      changeStep("submit");
    });
  });


  // form.addEventListener("submit-btn", (e) => {
  //   e.preventDefault();
  //   const inputs = [];
  //   form.querySelectorAll("input").forEach((input) => {
  //     const { name, value } = input;
  //     inputs.push({ name, value });
  //   });
  //   console.log(inputs);
  //   form.reset();
  // });

  function changeStep(button) {
    let index = 0;
    const active = document.querySelector(".stepactive");
    const inputDescription = document.getElementById("artwork_description");
    const inputTitle = document.getElementById("artwork_title");
    const inputFile = document.getElementById("files-input");
    index = steps.indexOf(active);
    steps[index].classList.remove("stepactive");
    if (button === "next" && inputTitle.value != "" && inputDescription.value != "") {
      index ++;
    } else if (button === "prev") {
      index --;
    } else if (button === "submit" && inputFile.files != null) {
      index++;
    }
    steps[index].classList.add("stepactive");
  }
}

export { initArtworkform };
