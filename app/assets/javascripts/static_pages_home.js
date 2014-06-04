$(window).load(function() {


    setTimeout(slideLeftImg,1000);

    var la = $(".slide.s-left").toArray().reverse();
    var ltop;

    var ra = $(".slide.s-right").toArray().reverse();
    var rtop;


    var H = "-" + ($(".slide.s-left").css("height"));

    //alert(H);


    $(window).on('resize', function() {
        H = "-" + ($(".slide.s-left").css("height"));
    });

    function slideLeftImg() {
        $(la[0]).stop().animate({

            top: H

        }, 800, 'easeInOutExpo', function() {

            ltop = la.shift();
            la.push(ltop);

            $(la).each( function(i) {
                $(this).css( { zIndex: (100-i) } );
            });

            //$(ra).css({ zIndex: 1 });
            $(ltop).css({ top: 0 });

            setTimeout(slideRightImg,3000);
        });
    }

    function slideRightImg() {
        //alert('hete');
        $(ra[0]).stop().animate({

            top: H

        }, 800, 'easeInOutExpo', function() {

            rtop = ra.shift();
            ra.push(rtop);

            $(ra).each( function(i) {
                $(this).css( { zIndex: (100-i) } );
            });

            //$(ra).css({ zIndex: 1 });
            $(rtop).css({ top: 0 });
            //$(".slide.s-right").stop().delay(2000).animate({ top: 0}, 400);
            setTimeout(slideLeftImg,3000);
        });
    }

});