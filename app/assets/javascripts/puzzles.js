window.addEventListener("load", function() {
  var slider = document.getElementById("puzzle_level");
  var levField = document.getElementById("puzzle_level-value");
  slider.addEventListener("change", function () {
    levField.innerText = this.value
  });
});
