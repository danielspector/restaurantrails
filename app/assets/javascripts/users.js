$(document).ready(function() {
  $(document).on("click", ".tiny.alert.round", function(){
    console.log("hit")
    $(this).closest(".whole").hide();
  });
});