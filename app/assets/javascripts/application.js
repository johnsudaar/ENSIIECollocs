// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require vendor/fastclick.js
//= require foundation
//= require_tree .
//= require toastr
//= require jquery.stellar
//= require dropzone


toastr.options = {
  "closeButton": true,
  "debug": false,
  "newestOnTop": false,
  "progressBar": false,
  "positionClass": "toast-bottom-right",
  "preventDuplicates": false,
  "onclick": null,
  "showDuration": "300",
  "hideDuration": "1000",
  "timeOut": "5000",
  "extendedTimeOut": "1000",
  "showEasing": "swing",
  "hideEasing": "linear",
  "showMethod": "fadeIn",
  "hideMethod": "fadeOut"
};

$(function(){
  $(document).foundation();
  $.stellar();
  $(".login-dropdown-button").click(
    function(e) {
      var leftOffset = $(e.target).offset().left;
      var dropDown = $('#login_drop_down');
      var d_width = dropDown.width();
      var style = "<style id=\"H4CK1NG\"> .f-dropdown::before{left:"+(d_width)+"px;} .f-dropdown::after{left:"+(d_width-1)+"px;}</style>";
      $("#H4CK1NG").remove();
      $(style).appendTo($("head"));
      if (! dropDown.hasClass('visible'))
        dropDown.addClass('visible').css({ left: leftOffset-200 });
      else
        dropDown.removeClass('visible').css({ left: -9999 });
  });
});


$(function (){
        $("#connexion_user").submit(function(event){
                event.preventDefault();
                var email = $("#connexion_user").find("#user_email").val();
                var password = $("#connexion_user").find("#user_password").val();
                $.post(login_post_url, {email: email, password: password}).done(function(data){
                        if(data.type =="error"){
                          toastr.error(data.message, "Erreur");
                        }else{
                          window.location.replace(home_url);
                        }
                }, "json");
        });
});
