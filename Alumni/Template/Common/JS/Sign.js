/* Code by Shindo. March, 2015. */

$(document).ready(function () {
    if (window.DD_belatedPNG)
        DD_belatedPNG.fix("*");
});

function Close() {
    parent.hideCover();
}

function fixZIndex(target) {
    if (navigator.userAgent.indexOf("MSIE 6.0") != -1 || navigator.userAgent.indexOf("MSIE 7.0") != -1) {
        // z-index fix for ie6, 7
        var zIndexNumber = 1000;
        $(target + " div").each(function () {
            $(this).css('zIndex', zIndexNumber);
            zIndexNumber -= 10;
        });
    }
}

function setSigninInfo(content, css) {
    var info = parent.$("#signin_iframe").contents().find("#info");
    info.css(css);
    info.html(content);
    info.show();
    
    parent.$("#signin_iframe").contents().find(".input").eq(0).css("marginTop", "10px");
}