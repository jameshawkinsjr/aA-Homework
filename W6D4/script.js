document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!
  document.querySelectorAll(".list-container form").forEach((input) => {
    input.addEventListener("submit", event => {
      event.preventDefault();
      const form = event.target;
      let newPlace = form.childNodes[1].value
      form.childNodes[1].value = "";
      let li = document.createElement("li");
      let place = document.createTextNode(`${newPlace}`);
      li.appendChild(place);
      let list = document.getElementById("sf-places");
      list.appendChild(li);
    });
  });


  // adding new photos

  // --- your code here!

  document.querySelectorAll("button").forEach((button) => {
    button.addEventListener("click", event => {
      event.preventDefault();
      const button = event.target;
      let form = document.getElementsByClassName("photo-form-container");
      // debugger
      form[0].classList.remove('hidden')
    });
  });

  document.querySelectorAll(".photo-form-container form").forEach((input) => {
    input.addEventListener("submit", event => {
      event.preventDefault();
      const form = event.target;
      // debugger
      let url = form.childNodes[1].value
      form.childNodes[1].value = "";
      let li = document.createElement("li");
      let img = document.createElement("img");
      img.src=`${url}`;
      // debugger
      li.appendChild(img);
      let list = document.getElementsByClassName("dog-photos");
      list[0].appendChild(li);
    });
  });


});
