$(document).ready(function() {
  $(document).on("click", ".tiny.alert.round", function(){
    if($(this).parents("div.row:not(.whole)").children(".row").length == 1){
      $(this).parents("div.row:not(.whole)").children("h3").append("<p class='empty'>Empty</p>")
    }
    $(this).closest(".whole").remove();
  });
});