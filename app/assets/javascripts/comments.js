// show and hide comment forms
window.addEventListener( "load", function() {
  var buttons = document.querySelectorAll(".button-comment");
  for (var i = 0; i < buttons.length; i++) {
    buttons[i].addEventListener( "click", function() {
      var form = document.getElementById("form-comment-" + this.id.slice(15));
      if (this.innerText == "Comment") {
        form.setAttribute("style", "display: block");
        this.innerText = "Hidde comment form"
      } else {
        form.removeAttribute("style");
        this.innerText = "Comment"
      };
    });
  };
});


// show and hide comments list
window.addEventListener( "load", function() {
  var button = document.getElementById("button-comments-list-all");
  button.addEventListener( "click", function() {
    var list = document.getElementById("comments-list-all");
    if (this.innerText == "Show comments") {
      list.setAttribute("style", "display: block");
      this.innerText = "Hide comments"
    } else {
      list.removeAttribute("style");
      this.innerText = "Show comments"
    };
  });
});


// show and hide comments inside comments list
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
