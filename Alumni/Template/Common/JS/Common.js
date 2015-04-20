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

    $('.dropdown').mouseenter(showSubMenu);
    $('.dropdown').click(showSubMenu);

    $(".service").hover(function () {
        $(this).animate({ width: '160px' });
    }, function () {
        $(this).animate({ width: '40px' });
    });

    //$('#cover_bg').click(hideCover);
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
    $(dialog).css({ left: (windowWidth - dialogWidth) / 2 });

    $("#cover_bg").fadeIn("fast", function () { $(dialog).fadeIn(); });
}

function hideCover() {
    $(".dialog").each(function() {
        $(this).fadeOut("fast", function () { $("#cover_bg").hide(); });
    });
}

function showSign(dialog, iframe, src) {
    $(dialog + " p").show();
    showCover(dialog);

    $(iframe).attr('src', src);
    $(iframe).load(function () {
        $(dialog + " p").fadeOut("fast", function () { $(iframe).show(); });
    });
}