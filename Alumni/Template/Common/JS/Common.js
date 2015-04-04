/* Code by Shindo. March, 2015. */

function showSubMenu() {
    $('.sublinks').stop(false, true).hide();

    var submenu = $(this).parent().next();

    if (submenu.attr('class') == undefined || submenu.attr('class').indexOf('sublinks') == -1) // not `sublinks`
        return;

    submenu.css({
        position: 'absolute',
        top: $(this).offset().top + $(this).height() + 'px',
        left: $(this).offset().left + 'px',
        zIndex: 1000
    });

    submenu.stop().slideDown(300);

    submenu.mouseleave(function () {
        $(this).slideUp(300);
    });
}

function updateTime() {
    var now = new Date();

    var year, month, date, hour, minute, second, day;

    switch (now.getDay()) {
        case 0: day = "星期日"; break;
        case 1: day = "星期一"; break;
        case 2: day = "星期二"; break;
        case 3: day = "星期三"; break;
        case 4: day = "星期四"; break;
        case 5: day = "星期五"; break;
        case 6: day = "星期六"; break;
    }

    year = now.getYear() % 1900 + 1900;
    month = now.getMonth() + 1;
    date = now.getDate();
    hour = now.getHours();
    minute = now.getMinutes();
    second = now.getSeconds();

    if (minute < 10) minute = '0' + minute;
    if (second < 10) second = '0' + second;

    $("#time").html(year + "年" + month + "月" + date + "日" + " " + day + " " + hour + ":" + minute + ":" + second);
    setTimeout("updateTime()", 1000);
}

$(document).ready(function () {
    if (window.DD_belatedPNG)
        DD_belatedPNG.fix("*");

    updateTime();

    if (navigator.userAgent.indexOf("MSIE 6.0") == -1) // not IE6
        $("#slider").bgStretcher({
            images: [
                 '/Template/Common/Image/Slider/4.jpg',
                 '/Template/Common/Image/Slider/2.jpg',
                 '/Template/Common/Image/Slider/3.jpg',
                 '/Template/Common/Image/Slider/1.jpg',
                 '/Template/Common/Image/Slider/5.jpg'
                ],
            imageWidth: 1920,
            imageHeight: 386,
            slideShowSpeed: 1000,
            nextSlideDelay: 10000,
            transitionEffect: 'fade',
            sequenceMode: 'normal',
            buttonPrev: '#prev',
            buttonNext: '#next',
            anchoring: 'center center',
            anchoringImg: 'center center'
        });

    $('.dropdown').mouseenter(showSubMenu);
    $('.dropdown').click(showSubMenu);

    $('#cover_bg').click(hideCover);
});

$(window).resize(function () {
    var windowWidth = $(window).width(), windowHeight = $(window).height();
    $(".dialog").each(function () {
        $(this).css({ left: (windowWidth - $(this).width()) / 2, top: (windowHeight - $(this).height()) / 2 });
    });
});

function showCover(dialog) {
    var wrapperWidth = $(".wrapper").width(), wrapperHeight = $(".wrapper").height();
    var windowWidth = $(window).width(), windowHeight = $(window).height();
    var dialogWidth = $(dialog).width(), dialogHeight = $(dialog).height();

    $("#cover_bg").css({ height: wrapperHeight, display: "block" });
    $(dialog).css({ left: (windowWidth - dialogWidth) / 2, top: (windowHeight - dialogHeight) / 2 });

    $("#cover_bg").show("fast", function () { $(dialog).fadeIn(); });
}

function hideCover() {
    $(".dialog").each(function() {
        $(this).fadeOut("fast", function () { $("#cover_bg").hide(); });
    });
}

function showLogin() {
    $("#dialog_signin p").show();
    $("#dialog_signin iframe").hide();
    showCover('#dialog_signin');

    $("#signin_iframe").attr('src', '/SNS/SignIn.aspx?t=' + Math.random());
    $("#signin_iframe").ready(function () {
        $("#dialog_signin p").fadeOut("fast", function() { $("#dialog_signin iframe").fadeIn(); });
    });
}