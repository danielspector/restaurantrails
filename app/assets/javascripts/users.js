$(document).ready(function() {
  $(document).on("click", ".tiny.alert.round", function(){
    $(this).closest(".whole_zip").hide();
  });
});