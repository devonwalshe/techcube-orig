// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require_tree .
//= require bootstrap
//= require bootstrap-datepicker
//= require bootstrap-datetimepicker
//= require tinymce/tinymce.min.js
//= require_self    


tinymce.init({
    selector: "textarea",
    plugins: "fullscreen wordcount media image preview code table",
    toolbar: "bold italic underline strikethrough subscript superscript outdent indent selectall removeformat blockquote numlist bullist alignleft aligncenter alignright alignjustify undo redo fullscreen media image code preview underline inserttable tableprops deletetable cell row column wordcount"
 });  
  
$(document).on("focus", "[data-behaviour~='datepicker']", function(e){
    $(this).datepicker({"format": "yyyy-mm-dd", "weekStart": 1, "autoclose": true});
});

