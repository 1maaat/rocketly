const shareArtwork = () => {
  const shareButton = document.querySelector("#buttonshareartwork")
  if (shareButton) {
    shareButton.addEventListener("click", () => {
      const data = {
        "template": "V4WN6JDxBENZ3Gqjkv",
        "modifications": [
          {
            "name": "powered by",
            "text": "powered by Rocketly",
            "color": null,
            "background": null
          },
          {
            "name": "artwork_top",
            "image_url": "https://cdn.bannerbear.com/sample_images/welcome_bear_photo.jpg"
          },
          {
            "name": "artist_bg_top",
            "color": null
          },
          {
            "name": "artist_name-top",
            "text": "You can change this text",
            "color": null,
            "background": null
          },
          {
            "name": "poll_placeholder",
            "color": null
          },
          {
            "name": "text_container_8",
            "text": "Insta Poll Placeholder",
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
          data.modifications[1].image_url = artwork.querySelector(".imgBx img").attributes.src.value;
          data.modifications[3].text = artwork.querySelector(".info-challenge p").innerText;
          fetch('https://sync.api.bannerbear.com/v2/images', {
            method: 'POST',
            body: JSON.stringify(data),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': `Bearer Z8gCSusJGDcxaUnxnGlyiwtt`
            }
          }).then(response => response.json())
            .then((data) => {
              const story = document.createElement("img");
              story.setAttribute("src", data.image_url_png);
              document.getElementById("showArtwork").appendChild(story);
            });
        }
      });
    });
  }
}

export { shareArtwork }
