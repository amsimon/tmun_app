


$(document).ready( function() {








});



$(window).load(function() {




    var bgs = $(".bg").toArray();
    var bgtop;
    var dir = -1;

    slideLeftImg();

    function slideLeftImg() {





        var $b0 = $(bgs[0]);
        var $b1 = $(bgs[1]);

        var parsed1 = (2 * dir) + '%';
        var parsed2 = (4 * dir) + '%';

        var parsed3 = (-4 * dir) + '%';

        $b0.fadeTo(4000, .4).transition({
            scale: 1.1
        }, {duration: 4000, easing: 'linear', queue: false, complete: function() {
            $b0.stop().fadeOut(4000).transition({
                scale: 1.2
            }, {duration: 4000, easing: 'linear', queue: false, complete: function() {

                $b0.css({
                    scale: 1
                });
            }});

                bgtop = bgs.shift();
                bgs.push(bgtop);

                dir = dir * -1;

                slideLeftImg();

        }});
        /*    , function() {

         $b0.fadeOut(1900);

         $b0.transition({
         opacity: 0,
         x: '4%'
         }, 2000, 'linear', function() {

         $b0.css({
         x: '-4%'
         });

         bgtop = bgs.shift();
         bgs.push(bgtop);

         dir = dir * -1;
         slideLeftImg();
         });
         });*/
    }

/*
    var la = $(".slide.s-left").toArray().reverse();
    var ltop;

    var ra = $(".slide.s-right").toArray().reverse();
    var rtop;


    var H = "-" + ($(".slide.s-left").css("height"));

    //alert(H);

    var eas = 'easeInSine';
    var sp = 700;
    var del = 3000;


    setTimeout(slideLeftImg,1000);


    $(window).on('resize', function() {
        H = "-" + ($(".slide.s-left").css("height"));
    });

    function slideLeftImg() {
        var $l = $(la[0]);
        $l.stop().animate({
            top: -1
        }, 1, 'linear').animate({

            top: H,
            opacity: -5

        }, sp, eas, function() {

            ltop = la.shift();
            la.push(ltop);

            $(la).each( function(i) {
                var $this = $(this);
                $this.css( { zIndex: (100-i) } );
            });

            //$(ra).css({ zIndex: 1 });
            var $ltop =  $(ltop);
            $ltop.css({ top: 0, opacity: 1 });

            setTimeout(slideRightImg, del);
        });
    }

    function slideRightImg() {
        //alert('hete');
        $(ra[0]).stop().animate({

            top: H,
            opacity: -5

        }, sp, eas, function() {

            rtop = ra.shift();
            ra.push(rtop);

            $(ra).each( function(i) {
                $(this).css( { zIndex: (100-i) } );
            });

            //$(ra).css({ zIndex: 1 });
            $(rtop).css({ top: 0, opacity: 1 });
            //$(".slide.s-right").stop().delay(2000).animate({ top: 0}, 400);
            setTimeout(slideLeftImg, del);
        });
    }*/
   //var yo = $('.gde').offset().top;
   // //alert("Off: " + yo + "   H: " + $(window).height() );
   //
   // //$('.gde').height( $(document).height() -  yo  );
   // $('#everything').height($('.gde').height() + $('footer').height()  + $('.container#news').outerHeight() );
});

$(window).resize(function() {
   // var yo = $('.gde').offset().top;
   ////$('.gde').height( $(document).height() -  yo  );
   // $('#everything').height($('.gde').height() + $('footer').height()   + $('.container#news').outerHeight() );
});