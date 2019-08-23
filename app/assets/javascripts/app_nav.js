$(document).ready(function(){
    $(".nav-link").on("click", function(e){
        e.preventDefault();
        $(this).hide("drop", { direction: "down" }, 400));
    })
})