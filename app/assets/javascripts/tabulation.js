$(document).ready(function() {

//Get the modal
    let modal = document.getElementById("modal1");
// Get the button that opens the modal
    let signup = document.getElementById("signup");
// Get the <span> element that closes the modal
    let span = document.getElementsByClassName("close")[0];
// When the user clicks on the button, open the modal
    signup.addEventListener('click',function(e){
        e.preventDefault();
        modal.style.display = "block";
    });
    // When the user clicks on <span> (x), close the modal
    span.addEventListener('click',function(e){
        e.preventDefault();
        modal.style.display = "none";
    });

    //Get the modal
    let modal0 = document.getElementById("modal2");
// Get the button that opens the modal
    let login = document.getElementById("login");
// Get the <span> element that closes the modal
    let span1 = document.getElementsByClassName("close1")[0];
// When the user clicks on the button, open the modal
    login.addEventListener('click',function(e){
        e.preventDefault();
        modal0.style.display = "block";
    });
    // When the user clicks on <span> (x), close the modal
    span1.addEventListener('click',function(e){
        e.preventDefault();
        modal0.style.display = "none";
    });

    window.onclick = function(event) {
      if (event.target == modal) {
        modal.style.display = "none";
     }else if(event.target == modal0){
          modal0.style.display = "none";
      }
    };


});