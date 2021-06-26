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
//= require jquery3
//= require popper
//= require bootstrap-sprockets

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

/*global $*/

$(function () {
  $(document).on('turbolinks:load', () => {
    $('#customer_postal_code').jpostal({
      postcode: [
        '#customer_postal_code'
      ],
      address: {
        "#customer_address": "%3%4%5%6%7",
      }
    });
  });
});

$(function () {
  $(document).on('turbolinks:load', () => {
    $('#order_postal_code').jpostal({
      postcode: [
        '#order_postal_code'
      ],
      address: {
        "#order_address": "%3%4%5%6%7",
      }
    });
  });
});

$(function () {
  $(document).on('turbolinks:load', () => {
    $('#address_postal_code').jpostal({
      postcode: [
        '#address_postal_code'
      ],
      address: {
        "#address_address": "%3%4%5%6%7",
      }
    });
  });
});

$(function () {
  $(document).on('turbolinks:load', () => {
    $('#admin_postal_code').jpostal({
      postcode: [
        '#admin_postal_code'
      ],
      address: {
        "#admin_address": "%3%4%5%6%7",
      }
    });
  });
});

// 初回アクセス時のみロゴをフェードインさせる
$(function() {
	setTimeout(function(){
		$('.start p').fadeIn(1600);
	},500); //0.5秒後にロゴをフェードイン!
	setTimeout(function(){
		$('.start').fadeOut(500);
	},2500); //2.5秒後にロゴ含め真っ白背景をフェードアウト！
});

// リンクから遷移した時は非表示
// $(document).on('turbolinks:load', function () {
//   setTimeout(function(){
// 		$('.start p').fadeIn(1600);
// 	},500); //0.5秒後にロゴをフェードイン!
// 	setTimeout(function(){
// 		$('.start').fadeOut(500);
// 	},2500); //2.5秒後にロゴ含め真っ白背景をフェードアウト！
// });

// TOPページの新着商品を自動スライド
document.addEventListener("turbolinks:load", function() {
    $('.new-arrival').slick({
    arrows: false,
    autoplay: true,
		slidesToShow: 3,
		speed: 7500,
		autoplaySpeed: 0,
		centerMode: true,
		swipe: false,
    autoplay: true,
    pauseOnHover: false,
    pauseOnFocus: false
    });
});
