$(document).ready(function (e) {
    function handler1(e) {
        e.stopPropagation();
        $('.properties').addClass('openRSideBar').animate({ right: '0px' });
        $(this).addClass('openRSideBar');
        $(this).off("click", handler1).on("click", handler2);
        $('#modal').show();
    }
    function handler2(e) {
        e.stopPropagation();
        $('.properties').removeClass('openRSideBar').animate({ right: '-100%' });
        $('.propertiesToggle').removeClass('openRSideBar');
        $('.propertiesToggle').off("click", handler2).on("click", handler1);
        $('#modal').hide();
    }

    $(".propertiesToggle").one("click", handler1);

    $('body').click(function (event) {
        if (!$(event.target).closest('.properties.openRSideBar').length) {
            if ($('.properties').hasClass("openRSideBar")) {
                $('.properties').removeClass('openRSideBar').animate({ right: '-100%' });
                $(".propertiesToggle").on("click", handler1);
                $('#modal').hide();
            }
        }
    });
});
