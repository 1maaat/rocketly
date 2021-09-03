const createDownloadLink = (link) => {
  var image = new Image();
  image.crossOrigin = "anonymous";
  image.src = link;
  // get file name - you might need to modify this if your image url doesn't contain a file extension otherwise you can set the file name manually
  var fileName = "story";
  image.onload = function () {
    var canvas = document.createElement('canvas');
    canvas.width = this.naturalWidth; // or 'width' if you want a special/scaled size
    canvas.height = this.naturalHeight; // or 'height' if you want a special/scaled size
    canvas.getContext('2d').drawImage(this, 0, 0);
    var blob;
    // ... get as Data URI
    if (image.src.indexOf(".jpg") > -1) {
      blob = canvas.toDataURL("image/jpeg");
    } else if (image.src.indexOf(".png") > -1) {
      blob = canvas.toDataURL("image/png");
    } else if (image.src.indexOf(".gif") > -1) {
      blob = canvas.toDataURL("image/gif");
    } else {
      blob = canvas.toDataURL("image/png");
    }
    const anchor = document.createElement("a");
    const story = document.createElement("img");
    anchor.setAttribute("href", blob);
    anchor.setAttribute("download", fileName);
    story.setAttribute("src", blob);
    document.getElementById("showArtwork").appendChild(anchor).appendChild(story);
  };
}



const shareArtwork = () => {
  const shareButton = document.querySelector("#buttonshareartwork")
  if (shareButton) {
    shareButton.addEventListener("click", () => {
      const div = document.createElement("div")
      div.className = "d-flex justify-content-center";
      const spinner = document.createElement("div")
      spinner.className = "sk-plane";
      spinner.setAttribute("id", "spinner")
      div.appendChild(spinner)
      document.getElementById("showArtwork").appendChild(div)
      const data = {
        "template": "RGlOVA5Rvjj5nPgXwE",
        "modifications": [
          {
            "name": "rectangle_9",
            "color": null
          },
          {
            "name": "overlay",
            "color": null
          },
          {
            "name": "rectangle_7",
            "color": null
          },
          {
            "name": "artwork_top",
            "image_url": "https://cdn.bannerbear.com/sample_images/welcome_bear_photo.jpg"
          },
          {
            "name": "rectangle_6",
            "color": null
          },
          {
            "name": "artist_name_top",
            "text": "You can change this text",
            "color": null,
            "background": null
          },
          {
            "name": "powered_by",
            "text": "powered by Rocketly.cool",
            "color": null,
            "background": null
          },
          {
            "name": "rectangle_8",
            "color": null
          },
          {
            "name": "text_container_9",
            "text": "InstaPoll Placeholder",
            "color": null,
            "background": null
          }
        ],
        "webhook_url": null,
        "transparent": false,
        "metadata": null
      }
      const artworks = document.querySelectorAll(".card-index");
      artworks.forEach((artwork) => {
        if (artwork.dataset.selected === "true") {
          data.modifications[3].image_url = artwork.querySelector(".imgBx img").attributes.src.value;
          data.modifications[5].text = artwork.querySelector(".info-challenge p").innerText;
          fetch('https://sync.api.bannerbear.com/v2/images', {
            method: 'POST',
            body: JSON.stringify(data),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': `Bearer HV7r6THeKuqTCQbWVRl5aAtt`
            }
          }).then(response => response.json())
            .then((data) => {
              const spinnerElement = document.getElementById("spinner")
              if (typeof(spinnerElement) != 'undefined' && spinnerElement != null) {
                document.getElementById("spinner").remove()
              }
              createDownloadLink(data.image_url_png);
            });
        }
      });
    });
  }
}

export { shareArtwork }
