$(document).ready(function() {
  $(document).on("click", ".tiny.alert.round", function(){
    if($(this).parents("div.row:not(.whole)").children(".row").length == 1){
      $(this).parents("div.row:not(.whole)").children("h3").after("<p class='empty'>Empty</p>")
    }
    $(this).closest(".whole").remove();
  });
  // $(document).on("click", "a:contains('Delete my account')", function(){
  //   function confirmation() {
  //     var check = confirm('Are you sure?');
  //     if(check){window.location.href = 'http://example.com';}
  //     else{window.location.href = 'http://example.com';}
  //   }
  //   confirmation();
  // });
});