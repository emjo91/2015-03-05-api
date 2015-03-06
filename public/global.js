//This file is successfully connected!
window.onload = function () {
var command = document.getElementById("create");


function createStudent() {
  var request = new XMLHttpRequest;
  request.open("get", "http://localhost:4567/students/create");
  request.send();
  alert(request);
}

command.addEventListener("click", createStudent);
}
// document.getElementById("create").addEventListener("click", createStudent());