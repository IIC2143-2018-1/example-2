// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery3
//= require jquery.validate
//= require jquery.validate.additional-methods
//= require popper
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function(){
  $("#new_user").validate({
  //adding rule
    rules: {
    // email is required with format
    "user[email]": {
      required: true,
      email: true
    },
    // password is required
    "user[password]": {
      required: true,
      minlength: 6
    },
    // password_confirmation is required and is the same with password
    "user[password_confirmation]": {
      required: true,
      equalTo: "#user_password"
    }
    },
    // error messages
    messages: {
      mail:{
        required: "Email is required",
        email: "Please enter a valid email address"
      },
      password: {
        required: "Password is required",
        minlength: "Password is too short"
      },
      password_confirmation: {
        required: "Password confirmation is required",
        equalTo: "Password and password confirmation must be same"
      }
    }
  });
});
