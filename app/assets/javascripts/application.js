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
//= require jquery-ui
//= require jquery.transit
//= require cocoon
//= require jscolor

var navPos;
$(document).ready( function() {


    $('.tog').click( function() {
        $(this).next().stop().toggle();
        $('.triangle').toggleClass('rotated', 'not-rotated');
    });




/*  $(document).on('mouseenter', '.admin-line', function(){

    $(this).stop().animate( {
      width: '100%'
    }, 100, 'easeOutQuart');

    //alert('here');

  });

  $(document).on('mouseleave', '.admin-line', function(){

    $(this).stop().animate( {
      width: '32px'
    }, 100, 'easeOutQuart');
  });*/


  $(".sub-current").append('<img src="/assets/arrow-down.png" class="arrow-test" />');

    $(".answer").hide();

    $(".admin-container").hide();
    $('.admin-toggle-container').hide();

    $("ul.questions li").click( function() {
       $(this).find("div.answer").stop().slideToggle('fast');
    });

    $(".slider-cont").click( function() {
        $(".admin-container").toggle(300);
    });

    $(".question").prepend("<span class='arrow'>&#x25BC;</span>");

    $(".google-form").hide();

    $("div.button#apply-topic").click( function() {
        $(this).parent().next().stop().slideToggle('fast');
    });

  navPos = $('#branch-nav').offset().top;

});

$(window).scroll(function() {

  var currentScroll = $(window).scrollTop();

  if (currentScroll >= navPos) {
    $('#branch-nav').css({
      position: 'fixed',
      top: '0',
      left: '0'
    });
  } else {
    $('#branch-nav').css({
      position: 'absolute',
      top: '80px'
    });
  }
});

function adminExpand() {
    $(this).parent().next().animate({opacity: 1, top:0}, 100, function() {
        $(this).css({display: 'block'});
    });
    $(this).html('&times;');
    $(this).css({backgroundColor: 'black'});
    $(this).one("click", adminClose);
}

function adminClose() {
    $(this).parent().next().animate({opacity: 0, top:'-25px'}, 100, function() {
        $(this).css({display: 'none'});
    });
    $(this).html('A');
    $(this).css({backgroundColor: 'red'});
    $(this).one("click", adminExpand);
}

function adminOn() {
    $(this).children('.slider').stop().animate({left: 0}, 100).html('ON').css({backgroundColor: 'red', color: 'white'});
    $(this).one("click", adminOff);
}

function adminOff() {
    $(this).children('.slider').stop().animate({left: 32}, 100).html('OFF').css({backgroundColor: 'rgb(218, 218, 218)', color: 'gray'});
    $(this).one("click", adminOn);
}


$(window).load( function() {

/*    $('.navbar').on({
        mouseenter: function () {

            $(this).animate({
                opacity:.5//background: '#000000' //'0px 0px 20px black'
            }, 1000);
        },
        mouseleave: function () {
            $(this).animate({
               opacity:.9// background: '#FFFFFF' // '0px 0px 0px black'
            }, 1000);
        }
    });*/

    $('.alert').delay(3000).slideUp(400);

      $('.admin-line').on({
          mouseenter: function () {
              $(this).children('.words').stop().fadeIn(100).css("display","inline-block");
          },
          mouseleave: function () {
              $(this).children('.words').stop().fadeOut(100);
          }
      });

/*    $('.admin-container .clicker').on({
        click: function () {
            $(this).parent().next().fadeToggle(200);

            if ($(this).html('A')) {
                $(this).html('X');
            }
            else if ($(this).html('X')) {
                $(this).html('A');
            }
        }
    });*/

    $('.admin-container .clicker').one("click", adminExpand);

    $('.slider-cont').one("click", adminOff);



});
