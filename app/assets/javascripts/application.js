// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= bootstrap-sprockets
//= require select2

$( "#dropdown" ).select2({
    theme: "bootstrap"
});

/*===== Products#show - 變更顯示圖片 =====*/
$(document).on('mouseover', '.list-image', function () {
  $('.list-image').hover(function (event) {
    var src = $(this).attr("src")
    $('#imageshow').attr({"src": src, width: "400", height: "400"})

    $('.list-image').removeClass('list-image-active') //其他圖片移除鎖定狀態
    $(this).addClass('list-image-active') //當前圖片新增鎖定狀態
  });
})
