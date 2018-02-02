// show and hide comments
window.addEventListener( "load", function() {
  var buttons = document.querySelectorAll(".button-comment");
  for (var i = 0; i < buttons.length; i++) {
    buttons[i].addEventListener( "click", function() {
      var form = document.getElementById("form-comment-" + this.id.slice(15));
      if (this.innerText == "Add comment") {
        form.setAttribute("style", "display: block");
        this.innerText = "Hidde comment form"
      } else {
        form.removeAttribute("style");
        this.innerText = "Add comment"
      };
    });
  };
});
