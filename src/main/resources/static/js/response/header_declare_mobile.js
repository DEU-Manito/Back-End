$(document).ready(function (e) {
    $('.res-nav_click').click(function () {
        $('ul.toggle').slideToggle(600)
    });

    $(document).ready(function () {
        $(window).bind('scroll', function () {
            if ($(window).scrollTop() > 0) {
                $('#header_outer').addClass('fixed');
            }
            else {
                $('#header_outer').removeClass('fixed');
            }
        });

    });
});