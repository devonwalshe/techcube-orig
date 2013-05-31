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
//= require tinymce

tinymce.init({
    selector: "textarea",
    plugins: "fullscreen wordcount media image preview code table link textcolor iframe",
    toolbar: "bold italic underline strikethrough subscript superscript | forecolor backcolor styleselect fontsizeselect outdent indent numlist bullist alignleft aligncenter alignright alignjustify | selectall removeformat | link blockquote  undo redo fullscreen media iframe image code preview ",
    toolbar2: "table tableprops deletetable cell row column wordcount link",
    extended_valid_elements : "iframe[src|width|height|name|align]",
    style_formats: [{title: 'Open Sans', inline: 'span', styles: { 'font-family':'Open Sans'}},
                {title: 'MisoRegular', inline: 'span', styles: { 'font-family':'Miso'}},
                {title: 'MisoLight', inline: 'span', styles: { 'font-family':'MisoLight'}},
                {title: 'MisoBold', inline: 'span', styles: { 'font-family':'MisoBold'}},
                {title: 'Muli', inline: 'span', styles: { 'font-family':'Muli'}},
                {title: 'Arial', inline: 'span', styles: { 'font-family':'arial'}},
                {title: 'Book Antiqua', inline: 'span', styles: { 'font-family':'book antiqua'}},
                {title: 'Comic Sans MS', inline: 'span', styles: { 'font-family':'comic sans ms,sans-serif'}},
                {title: 'Courier New', inline: 'span', styles: { 'font-family':'courier new,courier'}},
                {title: 'Georgia', inline: 'span', styles: { 'font-family':'georgia,palatino'}},
                {title: 'Helvetica', inline: 'span', styles: { 'font-family':'helvetica'}},
                {title: 'Impact', inline: 'span', styles: { 'font-family':'impact,chicago'}},
                {title: 'Symbol', inline: 'span', styles: { 'font-family':'symbol'}},
                {title: 'Tahoma', inline: 'span', styles: { 'font-family':'tahoma'}},
                {title: 'Terminal', inline: 'span', styles: { 'font-family':'terminal,monaco'}},
                {title: 'Times New Roman', inline: 'span', styles: { 'font-family':'times new roman,times'}},

                {title: 'Verdana', inline: 'span', styles: { 'font-family':'Verdana'}}]
 });  
  
$(document).on("focus", "[data-behaviour~='datepicker']", function(e){
    $(this).datepicker({"format": "yyyy-mm-dd", "weekStart": 1, "autoclose": true});
});

