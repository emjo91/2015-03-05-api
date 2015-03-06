//This file is successfully connected!
window.onload = function () {
  
// ///////////////////////////////////////////////////////////// 
// Code for Modify Student (right now harcoded for age = 1000)
// /////////////////////////////////////////////////////////////
  
  var command = document.getElementById("modify");
  
  command.addEventListener("click", getId);
  
  function getId() {
    var id = prompt("Enter the student ID to be modified:");
    //make sure id is a string
    modifyStudent(id);
  } //end of getId
  

  function modifyStudent(id) {
    var request = new XMLHttpRequest;
    
    var query = "http://localhost:4567/students/" + id + "/modify"
    
    request.open("get", query);
    request.send();
    
    request.addEventListener("load", function() { 
    
      var result = JSON.parse(request.response);
      var age = result.age.toString();
    
    alert("Student's age modified to: " + age );
  } ) // end of the work done after send loads
  
  } //end of modifyStudent
  

///////////////////////////////////
//Code for Create student link
///////////////////////////////////

  var command = document.getElementById("create");

  function createStudent() {
    var request = new XMLHttpRequest;
    request.open("get", "http://localhost:4567/students/create");
    request.send();
    alert("Created Student!");
  } //end of createStudent

  command.addEventListener("click", createStudent);
  
  
  
} // end of window.onload
