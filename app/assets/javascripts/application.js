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

function add_fields(link, association, name) {
  var new_id = new Date().getTime();
  var re = new RegExp("new_" + association, 'g');
  $(link).parent().prev().append(name.replace(re, new_id));
}

function check(checkbox){
  $(checkbox).closest(".answers").find("input[type='checkbox']").not(this).prop("checked", false);
  $(checkbox).prop("checked", true)
}

// function next_word(i){
//   $('#word-'+i).attr('class','hidden');
//   $('#word-'+(i+1)).attr('class','');
// }

$(function(){
  $('.answer').click(function(){
    $(this).next().attr('checked','true');
    if($(this).attr('correct')=='true'){
      $(this).removeClass('btn-primary');
      $(this).addClass('btn-success');
    }else{
      $(this).removeClass('btn-primary');
      $(this).addClass('btn-danger');
      var bt = $(this).parent().find("button[correct='true']");
      setTimeout(function(){
        bt.removeClass('btn-primary');
        bt.addClass('btn-success');
      },300)
    }
    $(this).parent().find("button").attr('disabled', true);
  });
})
