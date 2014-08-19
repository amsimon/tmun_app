$(document).ready(function() {



});


$(window).load(function() {


    setTimeout(slideLeftImg,1000);

    var la = $(".slide.s-left").toArray().reverse();
    var ltop;

    var ra = $(".slide.s-right").toArray().reverse();
    var rtop;


    var H = "-" + ($(".slide.s-left").css("height"));

    //alert(H);

    var eas = 'easeInExpo';
    var sp = 700;
    var del = 3000;


    $(window).on('resize', function() {
        H = "-" + ($(".slide.s-left").css("height"));
    });

    function slideLeftImg() {
        var $l = $(la[0]);
        $l.stop().animate({
            top: -1
        }, 1, 'linear').animate({

            top: H,
            opacity:0

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
            opacity: 0

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
    }
   var yo = $('.gde').offset().top;
    //alert("Off: " + yo + "   H: " + $(window).height() );

    //$('.gde').height( $(document).height() -  yo  );
    $('#everything').height($('.outer').height() + $('#home_h1').outerHeight() + 0 );
});

$(window).resize(function() {
    var yo = $('.gde').offset().top;
   //$('.gde').height( $(document).height() -  yo  );
    $('#everything').height($('.outer').height() + $('#home_h1').outerHeight() + 0 );
});