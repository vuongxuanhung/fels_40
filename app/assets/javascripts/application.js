// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .

function remove_fields(link) {
  $(link).prev().val("true");
  $(link).parent().hide();
}

function add_fields(link, name) {
  var new_id = new Date().getTime();
  var r = /\d+/g;
  var m = r.exec(name);
  var re = new RegExp(m, 'g');
  $(link).parent().prev().append(name.replace(re,new_id));
}
