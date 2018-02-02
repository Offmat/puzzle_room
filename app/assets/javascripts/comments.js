// show and hide comment forms
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


// show and hide comments list
window.addEventListener( "load", function() {
  var buttons = document.querySelectorAll(".button-comments-list");
  for (var i = 0; i < buttons.length; i++) {
    buttons[i].addEventListener( "click", function() {
      var list = document.getElementById("comments-list-" + this.id.slice(21));
      if (this.innerText == "...") {
        list.setAttribute("style", "display: block");
        this.innerText = "<<"
      } else {
        list.removeAttribute("style");
        this.innerText = "..."
      };
    });
  };
});
