/*** </Vimeo> initialize***/
var huge_video_playing = {};
var autoplayMatch = {};
$('.thumb_wrapper').on('click', function (ev) {
    var hugeid = $(this).data('rowid');
    var myid = hugeid;
    myid = parseInt(myid);
    eval('player_' + myid + '.playVideo()')
    ev.preventDefault();

});

if (typeof sliderID_array == "undefined") {
    var sliderID_array = [];
}

var data_1 = [];
var event_stack_1 = [];
//huge_video_playing['video_is_playing_'+1]=false;
data_1["0"] = [];
data_1["0"]["id"] = "0";
data_1["0"]["image_url"] = "http://ototaihyundai.net/wp-content/uploads/2016/06/ototaihyundai.net-xetai.png";
data_1["0"]["description"] = "";
data_1["0"]["alt"] = "";
data_1["1"] = [];
data_1["1"]["id"] = "1";
data_1["1"]["image_url"] = "http://ototaihyundai.net/wp-content/uploads/2016/07/ototaihyundai.net-slide10.png";
data_1["1"]["description"] = "";
data_1["1"]["alt"] = "";
data_1["2"] = [];
data_1["2"]["id"] = "2";
data_1["2"]["image_url"] = "http://ototaihyundai.net/wp-content/uploads/2016/06/ototaihyundai.net-dongfeng.png";
data_1["2"]["description"] = "";
data_1["2"]["alt"] = "";
data_1["3"] = [];
data_1["3"]["id"] = "3";
data_1["3"]["image_url"] = "http://ototaihyundai.net/wp-content/uploads/2016/06/ototaihyundai.net-fuso.png";
data_1["3"]["description"] = "";
data_1["3"]["alt"] = "";
data_1["4"] = [];
data_1["4"]["id"] = "4";
data_1["4"]["image_url"] = "http://ototaihyundai.net/wp-content/uploads/2016/06/ototaihyundai.net-hyundai.png";
data_1["4"]["description"] = "";
data_1["4"]["alt"] = "";


var huge_it_trans_in_progress_1 = false;
var huge_it_transition_duration_1 = 1000;
var huge_interval = {};
var id_array_index = sliderID_array.length



var ifhasthumb = "dotstop";
sliderID_array[id_array_index] = // Stop autoplay.
    window.clearInterval(huge_interval['huge_it_playInterval_' + 1]);

var huge_it_current_key_1 = '';

function huge_it_move_dots_1() {
    var image_left = jQuery(".huge_it_slideshow_dots_active_1").position().left;
    var image_right = jQuery(".huge_it_slideshow_dots_active_1").position().left + jQuery(".huge_it_slideshow_dots_active_1").outerWidth(true);

}

function huge_it_testBrowser_cssTransitions_1() {
    return huge_it_testDom_1('Transition');
}

function huge_it_testBrowser_cssTransforms3d_1() {
    return huge_it_testDom_1('Perspective');
}

function huge_it_testDom_1(prop) {
    // Browser vendor CSS prefixes.
    var browserVendors = ['', '-webkit-', '-moz-', '-ms-', '-o-', '-khtml-'];
    // Browser vendor DOM prefixes.
    var domPrefixes = ['', 'Webkit', 'Moz', 'ms', 'O', 'Khtml'];
    var i = domPrefixes.length;
    while (i--) {
        if (typeof document.body.style[domPrefixes[i] + prop] !== 'undefined') {
            return true;
        }
    }
    return false;
}

function huge_it_cube_1(tz, ntx, nty, nrx, nry, wrx, wry, current_image_class, next_image_class, direction) {

    /* If browser does not support 3d transforms/CSS transitions.*/
    if (!huge_it_testBrowser_cssTransitions_1()) {
        jQuery(".huge_it_slideshow_dots_1").removeClass("huge_it_slideshow_dots_active_1").addClass("huge_it_slideshow_dots_deactive_1");
        jQuery("#huge_it_dots_" + huge_it_current_key_1 + "_1").removeClass("huge_it_slideshow_dots_deactive_1").addClass("huge_it_slideshow_dots_active_1");
        return huge_it_fallback_1(current_image_class, next_image_class, direction);
    }
    if (!huge_it_testBrowser_cssTransforms3d_1()) {
        return huge_it_fallback3d_1(current_image_class, next_image_class, direction);
    }
    //alert(current_image_class+' '+next_image_class);
    jQuery(current_image_class).css({
        'z-index': 'none'
    });
    jQuery(next_image_class).css({
        'z-index': 2
    });
    huge_it_trans_in_progress_1 = true;
    /* Set active thumbnail.*/
    jQuery(".huge_it_slideshow_dots_1").removeClass("huge_it_slideshow_dots_active_1").addClass("huge_it_slideshow_dots_deactive_1");
    jQuery("#huge_it_dots_" + huge_it_current_key_1 + "_1").removeClass("huge_it_slideshow_dots_deactive_1").addClass("huge_it_slideshow_dots_active_1");
    jQuery(".huge_it_slide_bg_1").css('perspective', 1000);
    jQuery(current_image_class).css({
        transform: 'translateZ(' + tz + 'px)',
        backfaceVisibility: 'hidden'
    });

    jQuery(".huge_it_slideshow_image_wrap_1,.huge_it_slide_bg_1,.huge_it_slideshow_image_item_1,.huge_it_slideshow_image_second_item_1 ").css('overflow', 'visible');

    jQuery(next_image_class).css({
        opacity: 1,
        filter: 'Alpha(opacity=100)',
        backfaceVisibility: 'hidden',
        transform: 'translateY(' + nty + 'px) translateX(' + ntx + 'px) rotateY(' + nry + 'deg) rotateX(' + nrx + 'deg)'
    });
    jQuery(".huge_it_slider_1").css({
        transform: 'translateZ(-' + tz + 'px)',
        transformStyle: 'preserve-3d'
    });
    /* Execution steps.*/
    setTimeout(function () {
        jQuery(".huge_it_slider_1").css({
            transition: 'all ' + huge_it_transition_duration_1 + 'ms ease-in-out',
            transform: 'translateZ(-' + tz + 'px) rotateX(' + wrx + 'deg) rotateY(' + wry + 'deg)'
        });
    }, 20);
    /* After transition.*/
    jQuery(".huge_it_slider_1").one('webkitTransitionEnd transitionend otransitionend oTransitionEnd mstransitionend', jQuery.proxy(huge_it_after_trans));

    function huge_it_after_trans() {
        /*if (huge_it_from_focus_1) {
          huge_it_from_focus_1 = false;
          return;
        }*/
        jQuery(".huge_it_slide_bg_1,.huge_it_slideshow_image_item_1,.huge_it_slideshow_image_second_item_1 ").css('overflow', 'hidden');
        jQuery(".huge_it_slide_bg_1").removeAttr('style');
        jQuery(current_image_class).removeAttr('style');
        jQuery(next_image_class).removeAttr('style');
        jQuery(".huge_it_slider_1").removeAttr('style');
        // alert(current_image_class+' '+next_image_class);
        jQuery(current_image_class).css({
            'opacity': 0,
            filter: 'Alpha(opacity=0)',
            'z-index': 1
        });
        jQuery(next_image_class).css({
            'opacity': 1,
            filter: 'Alpha(opacity=100)',
            'z-index': 2
        });
        // huge_it_change_watermark_container_1();
        huge_it_trans_in_progress_1 = false;
        if (typeof event_stack_1 !== 'undefined' && event_stack_1.length > 0) {
            key = event_stack_1[0].split("-");
            event_stack_1.shift();
            huge_it_change_image_1(key[0], key[1], data_1, true, false);
        }
    }
}

function huge_it_cubeH_1(current_image_class, next_image_class, direction) {
    /* Set to half of image width.*/
    var dimension = jQuery(current_image_class).width() / 2;
    if (direction == 'right') {
        huge_it_cube_1(dimension, dimension, 0, 0, 90, 0, -90, current_image_class, next_image_class, direction);
    } else if (direction == 'left') {
        huge_it_cube_1(dimension, -dimension, 0, 0, -90, 0, 90, current_image_class, next_image_class, direction);
    }
}

function huge_it_cubeV_1(current_image_class, next_image_class, direction) {
    /* Set to half of image height.*/
    var dimension = jQuery(current_image_class).height() / 2;
    /* If next slide.*/
    if (direction == 'right') {
        huge_it_cube_1(dimension, 0, -dimension, 90, 0, -90, 0, current_image_class, next_image_class, direction);
    } else if (direction == 'left') {
        huge_it_cube_1(dimension, 0, dimension, -90, 0, 90, 0, current_image_class, next_image_class, direction);
    }
}
/* For browsers that does not support transitions.*/
function huge_it_fallback_1(current_image_class, next_image_class, direction) {
    huge_it_fade_1(current_image_class, next_image_class, direction);
}
/* For browsers that support transitions, but not 3d transforms (only used if primary transition makes use of 3d-transforms).*/
function huge_it_fallback3d_1(current_image_class, next_image_class, direction) {
    huge_it_sliceV_1(current_image_class, next_image_class, direction);
}

function huge_it_none_1(current_image_class, next_image_class, direction) {
    jQuery(current_image_class).css({
        'opacity': 0,
        'z-index': 1
    });
    jQuery(next_image_class).css({
        'opacity': 1,
        'z-index': 2
    });

    /* Set active thumbnail.*/
    jQuery(".huge_it_slideshow_dots_1").removeClass("huge_it_slideshow_dots_active_1").addClass("huge_it_slideshow_dots_deactive_1");
    jQuery("#huge_it_dots_" + huge_it_current_key_1 + "_1").removeClass("huge_it_slideshow_dots_deactive_1").addClass("huge_it_slideshow_dots_active_1");
}

function huge_it_fade_1(current_image_class, next_image_class, direction) {
    if (huge_it_testBrowser_cssTransitions_1()) {

        jQuery(next_image_class).css('transition', 'opacity ' + huge_it_transition_duration_1 + 'ms linear');
        jQuery(current_image_class).css('transition', 'opacity ' + huge_it_transition_duration_1 + 'ms linear');
        jQuery(current_image_class).css({
            'opacity': 0,
            'z-index': 1
        });
        jQuery(next_image_class).css({
            'opacity': 1,
            'z-index': 2
        });
    } else {

        jQuery(current_image_class).animate({
            'opacity': 0,
            'z-index': 1
        }, huge_it_transition_duration_1);
        jQuery(next_image_class).animate({
            'opacity': 1,
            'z-index': 2
        }, {
            duration: huge_it_transition_duration_1,
            complete: function () {
                return false;
            }
        });
        // For IE.
        jQuery(current_image_class).fadeTo(huge_it_transition_duration_1, 0);
        jQuery(next_image_class).fadeTo(huge_it_transition_duration_1, 1);
    }
    jQuery(".huge_it_slideshow_dots_1").removeClass("huge_it_slideshow_dots_active_1").addClass("huge_it_slideshow_dots_deactive_1");
    jQuery("#huge_it_dots_" + huge_it_current_key_1 + "_1").removeClass("huge_it_slideshow_dots_deactive_1").addClass("huge_it_slideshow_dots_active_1");
}

function huge_it_grid_1(cols, rows, ro, tx, ty, sc, op, current_image_class, next_image_class, direction) {
    /* If browser does not support CSS transitions.*/
    if (!huge_it_testBrowser_cssTransitions_1()) {
        jQuery(".huge_it_slideshow_dots_1").removeClass("huge_it_slideshow_dots_active_1").addClass("huge_it_slideshow_dots_deactive_1");
        jQuery("#huge_it_dots_" + huge_it_current_key_1 + "_1").removeClass("huge_it_slideshow_dots_deactive_1").addClass("huge_it_slideshow_dots_active_1");
        return huge_it_fallback_1(current_image_class, next_image_class, direction);

    }
    huge_it_trans_in_progress_1 = true;
    /* Set active thumbnail.*/
    jQuery(".huge_it_slideshow_dots_1").removeClass("huge_it_slideshow_dots_active_1").addClass("huge_it_slideshow_dots_deactive_1");
    jQuery("#huge_it_dots_" + huge_it_current_key_1 + "_1").removeClass("huge_it_slideshow_dots_deactive_1").addClass("huge_it_slideshow_dots_active_1");
    /* The time (in ms) added to/subtracted from the delay total for each new gridlet.*/
    var count = (huge_it_transition_duration_1) / (cols + rows);
    /* Gridlet creator (divisions of the image grid, positioned with background-images to replicate the look of an entire slide image when assembled)*/
    function huge_it_gridlet(width, height, top, img_top, left, img_left, src, imgWidth, imgHeight, c, r) {
        var delay = (c + r) * count;
        /* Return a gridlet elem with styles for specific transition.*/
        return jQuery('<div class="huge_it_gridlet_1" />').css({
            width: width,
            height: height,
            top: top,
            left: left,
            backgroundImage: 'url("' + src + '")',
            backgroundColor: jQuery(".huge_it_slideshow_image_wrap_1").css("background-color"),
            /*backgroundColor: rgba(0, 0, 0, 0),*/
            backgroundRepeat: 'no-repeat',
            backgroundPosition: img_left + 'px ' + img_top + 'px',
            backgroundSize: imgWidth + 'px ' + imgHeight + 'px',
            transition: 'all ' + huge_it_transition_duration_1 + 'ms ease-in-out ' + delay + 'ms',
            transform: 'none'
        });
    }
    /* Get the current slide's image.*/
    var cur_img = jQuery(current_image_class).find('img');
    /* Create a grid to hold the gridlets.*/
    var grid = jQuery('<div />').addClass('huge_it_grid_1');
    /* Prepend the grid to the next slide (i.e. so it's above the slide image).*/
    jQuery(current_image_class).prepend(grid);
    /* vars to calculate positioning/size of gridlets*/
    var cont = jQuery(".huge_it_slide_bg_1");
    var imgWidth = cur_img.width();
    var imgHeight = cur_img.height();
    var contWidth = cont.width(),
        contHeight = cont.height(),
        imgSrc = cur_img.attr('src'),
        /*.replace('/thumb', ''),*/
        colWidth = Math.floor(contWidth / cols),
        rowHeight = Math.floor(contHeight / rows),
        colRemainder = contWidth - (cols * colWidth),
        colAdd = Math.ceil(colRemainder / cols),
        rowRemainder = contHeight - (rows * rowHeight),
        rowAdd = Math.ceil(rowRemainder / rows),
        leftDist = 0,
        img_leftDist = (jQuery(".huge_it_slide_bg_1").width() - cur_img.width()) / 2;
    tx = tx === 'auto' ? contWidth : tx;
    tx = tx === 'min-auto' ? -contWidth : tx;
    ty = ty === 'auto' ? contHeight : ty;
    ty = ty === 'min-auto' ? -contHeight : ty;
    /* Loop through cols*/
    for (var i = 0; i < cols; i++) {
        var topDist = 0,
            img_topDst = (jQuery(".huge_it_slide_bg_1").height() - cur_img.height()) / 2,
            newColWidth = colWidth;
        if (colRemainder > 0) {
            var add = colRemainder >= colAdd ? colAdd : colRemainder;
            newColWidth += add;
            colRemainder -= add;
        }
        for (var j = 0; j < rows; j++) {
            var newRowHeight = rowHeight,
                newRowRemainder = rowRemainder;
            if (newRowRemainder > 0) {
                add = newRowRemainder >= rowAdd ? rowAdd : rowRemainder;
                newRowHeight += add;
                newRowRemainder -= add;
            }
            grid.append(huge_it_gridlet(newColWidth, newRowHeight, topDist, img_topDst, leftDist, img_leftDist, imgSrc, imgWidth, imgHeight, i, j));
            topDist += newRowHeight;
            img_topDst -= newRowHeight;
        }
        img_leftDist -= newColWidth;
        leftDist += newColWidth;
    }
    var last_gridlet = grid.children().last();
    grid.show();
    cur_img.css('opacity', 0);
    grid.children().first().addClass('rs-top-left');
    grid.children().last().addClass('rs-bottom-right');
    grid.children().eq(rows - 1).addClass('rs-bottom-left');
    grid.children().eq(-rows).addClass('rs-top-right');
    setTimeout(function () {
        grid.children().css({
            opacity: op,
            transform: 'rotate(' + ro + 'deg) translateX(' + tx + 'px) translateY(' + ty + 'px) scale(' + sc + ')'
        });
    }, 1);
    jQuery(next_image_class).css('opacity', 1);
    /* After transition.*/
    jQuery(last_gridlet).one('webkitTransitionEnd transitionend otransitionend oTransitionEnd mstransitionend', jQuery.proxy(huge_it_after_trans));

    function huge_it_after_trans() {
        jQuery(current_image_class).css({
            'opacity': 0,
            'z-index': 1
        });
        jQuery(next_image_class).css({
            'opacity': 1,
            'z-index': 2
        });
        cur_img.css('opacity', 1);
        grid.remove();
        huge_it_trans_in_progress_1 = false;
        if (typeof event_stack_1 !== 'undefined' && event_stack_1.length > 0) {
            key = event_stack_1[0].split("-");
            event_stack_1.shift();
            huge_it_change_image_1(key[0], key[1], data_1, true, false);
        }
    }
}

function huge_it_sliceH_1(current_image_class, next_image_class, direction) {
    if (direction == 'right') {
        var translateX = 'min-auto';
    } else if (direction == 'left') {
        var translateX = 'auto';
    }
    huge_it_grid_1(1, 8, 0, translateX, 0, 1, 0, current_image_class, next_image_class, direction);
}

function huge_it_sliceV_1(current_image_class, next_image_class, direction) {
    if (direction == 'right') {
        var translateY = 'min-auto';
    } else if (direction == 'left') {
        var translateY = 'auto';
    }
    huge_it_grid_1(10, 1, 0, 0, translateY, 1, 0, current_image_class, next_image_class, direction);
}

function huge_it_slideV_1(current_image_class, next_image_class, direction) {
    if (direction == 'right') {
        var translateY = 'auto';
    } else if (direction == 'left') {
        var translateY = 'min-auto';
    }
    huge_it_grid_1(1, 1, 0, 0, translateY, 1, 1, current_image_class, next_image_class, direction);
}

function huge_it_slideH_1(current_image_class, next_image_class, direction) {
    if (direction == 'right') {
        var translateX = 'min-auto';
    } else if (direction == 'left') {
        var translateX = 'auto';
    }
    huge_it_grid_1(1, 1, 0, translateX, 0, 1, 1, current_image_class, next_image_class, direction);
}

function huge_it_scaleOut_1(current_image_class, next_image_class, direction) {
    huge_it_grid_1(1, 1, 0, 0, 0, 1.5, 0, current_image_class, next_image_class, direction);
}

function huge_it_scaleIn_1(current_image_class, next_image_class, direction) {
    huge_it_grid_1(1, 1, 0, 0, 0, 0.5, 0, current_image_class, next_image_class, direction);
}

function huge_it_blockScale_1(current_image_class, next_image_class, direction) {
    huge_it_grid_1(8, 6, 0, 0, 0, .6, 0, current_image_class, next_image_class, direction);
}

function huge_it_kaleidoscope_1(current_image_class, next_image_class, direction) {
    huge_it_grid_1(10, 8, 0, 0, 0, 1, 0, current_image_class, next_image_class, direction);
}

function huge_it_fan_1(current_image_class, next_image_class, direction) {
    if (direction == 'right') {
        var rotate = 45;
        var translateX = 100;
    } else if (direction == 'left') {
        var rotate = -45;
        var translateX = -100;
    }
    huge_it_grid_1(1, 10, rotate, translateX, 0, 1, 0, current_image_class, next_image_class, direction);
}

function huge_it_blindV_1(current_image_class, next_image_class, direction) {
    huge_it_grid_1(1, 8, 0, 0, 0, .7, 0, current_image_class, next_image_class);
}

function huge_it_blindH_1(current_image_class, next_image_class, direction) {
    huge_it_grid_1(10, 1, 0, 0, 0, .7, 0, current_image_class, next_image_class);
}

function huge_it_random_1(current_image_class, next_image_class, direction) {
    var anims = ['sliceH', 'sliceV', 'slideH', 'slideV', 'scaleOut', 'scaleIn', 'blockScale', 'kaleidoscope', 'fan', 'blindH', 'blindV'];
    /* Pick a random transition from the anims array.*/
    this["huge_it_" + anims[Math.floor(Math.random() * anims.length)] + "_1"](current_image_class, next_image_class, direction);
}

function iterator_1() {
    var iterator = 1;

    return iterator;
}

function huge_it_change_image_1(current_key, key, data_1, from_effect, clicked) {

    if (data_1[key]) {
        if (!from_effect) {
            jQuery("#huge_it_current_image_key_1").val(key);
            current_key = jQuery(".huge_it_slideshow_dots_active_1").attr("data-image_key");
        }

        if (huge_it_trans_in_progress_1) {
            event_stack_1.push(current_key + '-' + key);
            return;
        }
        var direction = 'right';
        if (huge_it_current_key_1 > key) {
            var direction = 'left';
        } else if (huge_it_current_key_1 == key) {
            return false;
        }
        huge_it_current_key_1 = key;
        jQuery("#huge_it_slideshow_image_1").attr('data-image_id', data_1[key]["id"]);


        jQuery(".huge_it_slideshow_title_text_1").html(data_1[key]["alt"]);
        jQuery(".huge_it_slideshow_description_text_1").html(data_1[key]["description"]);

        var current_image_class = "#image_id_1_" + data_1[current_key]["id"];
        var next_image_class = "#image_id_1_" + data_1[key]["id"];
        if (jQuery(current_image_class).find('.huge_it_video_frame_1').length > 0) {
            var streffect = 'random';
            if (streffect == "cubeV" || streffect == "cubeH" || streffect == "none" || streffect == "fade") {
                huge_it_random_1(current_image_class, next_image_class, direction);
            } else {
                huge_it_fade_1(current_image_class, next_image_class, direction);
            }
        } else {
            huge_it_random_1(current_image_class, next_image_class, direction);
        }
        jQuery('.huge_it_slideshow_title_text_1').removeClass('none');
        if (jQuery('.huge_it_slideshow_title_text_1').html() == "") {
            jQuery('.huge_it_slideshow_title_text_1').addClass('none');
        }

        jQuery('.huge_it_slideshow_description_text_1').removeClass('none');
        if (jQuery('.huge_it_slideshow_description_text_1').html() == "") {
            jQuery('.huge_it_slideshow_description_text_1').addClass('none');
        }
        jQuery(current_image_class).find('.huge_it_slideshow_title_text_1').addClass('none');
        jQuery(current_image_class).find('.huge_it_slideshow_description_text_1').addClass('none');
        huge_it_move_dots_1();
        /*** <vy api>  for vimeo and youtube stop pause play etc... ***/
        var nextVideo = jQuery('#video_id_1_' + key).attr('data-element-id');
        var currentVideo = jQuery('#video_id_1_' + current_key).attr('data-element-id'); /*** add ***/
        (currentVideo || nextVideo) && stopYoutubeVideo(currentVideo, nextVideo);
        if ((jQuery('#player_1_' + current_key)).hasClass('huge-it-iframe-vimeo')) {
            jQuery('#player_1_' + current_key).vimeo('pause');

        }
        if ((jQuery('#player_1_' + key)).hasClass('huge-it-iframe-vimeo') && ('off' == 'on')) {
            jQuery('#player_1_' + key).vimeo('play');
        }
        window.clearInterval(huge_interval['huge_it_playInterval_' + 1]);
        play_1();
    }
}
var staticthumbWidth;
jQuery(window).load(function () {
    staticthumbWidth = jQuery('#huge_it_thumb_slider>li').width()

})

function huge_it_popup_resize_1() {
    var staticsliderwidth = 1360;
    var sliderwidth = 1360;
    var thumbWidth = jQuery(".huge_it_slideshow_thumbnails_1").width();
    var bodyWidth = jQuery(window).width();
    var parentWidth = jQuery(".huge_it_slideshow_image_wrap_1").parent().width();
    //if responsive js late responsive.js @  take body size and not parent div
    jQuery(".huge_it_slideshow_thumbnails_1").css({
        height: 100
    });
    if (sliderwidth > parentWidth) {
        sliderwidth = parentWidth;
    }
    if (sliderwidth > bodyWidth) {
        sliderwidth = bodyWidth;
    }
    var str = (500 / staticsliderwidth);


    jQuery(".huge_it_slideshow_thumbnails_1").css({
        width: thumbWidth
    });

    var str2 = (100 / staticthumbWidth);

    jQuery(".huge_it_slideshow_thumbnails_1").css({
        height: thumbWidth * str2
    });
    jQuery(".bx-viewport").css({
        height: thumbWidth * str2
    });
    jQuery(".huge_it_slideshow_image_wrap_1").css({
        width: (sliderwidth)
    });
    jQuery(".huge_it_slideshow_image_wrap_1").css({
        height: ((sliderwidth) * str)
    });

    jQuery(".huge_it_slideshow_image_container_1").css({
        width: (sliderwidth)
    });
    jQuery(".huge_it_slideshow_image_container_1").css({
        height: ((sliderwidth) * str)
    });

    if ("top" == "middle") {
        var titlemargintopminus = jQuery(".huge_it_slideshow_title_text_1").outerHeight() / 2;
    }
    if ("right" == "center") {
        var titlemarginleftminus = jQuery(".huge_it_slideshow_title_text_1").outerWidth() / 2;
    }
    jQuery(".huge_it_slideshow_title_text_1").css({
        cssText: "margin-top:-" + titlemargintopminus + "px; margin-left:-" + titlemarginleftminus + "px;"
    });

    if ("bottom" == "middle") {
        var descriptionmargintopminus = jQuery(".huge_it_slideshow_description_text_1").outerHeight() / 2;
    }
    if ("right" == "center") {
        var descriptionmarginleftminus = jQuery(".huge_it_slideshow_description_text_1").outerWidth() / 2;
    }
    jQuery(".huge_it_slideshow_description_text_1").css({
        cssText: "margin-top:-" + descriptionmargintopminus + "px; margin-left:-" + descriptionmarginleftminus + "px;"
    });
    jQuery("#huge_it_loading_image_1").css({
        display: "none"
    });
    jQuery(".huge_it_slideshow_image_wrap1_1").css({
        display: "block"
    });
    jQuery(".huge_it_slideshow_image_wrap_1").removeClass("nocolor");



    if ("resize" == "resize") {
        jQuery(".huge_it_slideshow_image_1,  .huge_it_slideshow_image_container_1 img").css({
            cssText: "width:" + sliderwidth + "px; height:" + ((sliderwidth) * str) + "px;"
        });
    } else {
        jQuery(".huge_it_slideshow_image_1,.huge_it_slideshow_image_item2_1").css({
            cssText: "max-width: " + sliderwidth + "px !important; max-height: " + (sliderwidth * str) + "px !important;"
        });
    }

    jQuery('.huge_it_video_frame_1').each(function (e) {
        jQuery(this).width(sliderwidth);
        jQuery(this).height(sliderwidth * str);
    });
}

jQuery(window).load(function () {
    jQuery(window).resize(function () {
        huge_it_popup_resize_1();
    });

    jQuery('#huge_it_slideshow_left_1').on('click', function () {
        huge_it_change_image_1(parseInt(jQuery('#huge_it_current_image_key_1').val()), (parseInt(jQuery('#huge_it_current_image_key_1').val()) - iterator_1()) >= 0 ? (parseInt(jQuery('#huge_it_current_image_key_1').val()) - iterator_1()) % data_1.length : data_1.length - 1, data_1, false, true);
        return false;
    });

    jQuery('#huge_it_slideshow_right_1').on('click', function () {
        huge_it_change_image_1(parseInt(jQuery('#huge_it_current_image_key_1').val()), (parseInt(jQuery('#huge_it_current_image_key_1').val()) + iterator_1()) % data_1.length, data_1, false, true);
        return false;
    });
    huge_it_popup_resize_1();
    /* Disable right click.*/
    jQuery('div[id^="huge_it_container"]').bind("contextmenu", function () {
        return false;
    });

    /*HOVER SLIDESHOW*/
    jQuery("#huge_it_slideshow_image_container_1, .huge_it_slideshow_image_container_1, .huge_it_slideshow_dots_container_1,#huge_it_slideshow_right_1,#huge_it_slideshow_left_1").hover(function () {
        //errorlogjQuery(".huge_it_slideshow_image_wrap_1").after(" -- hover -- <br /> ");
        jQuery("#huge_it_slideshow_right_1").css({
            'display': 'inline'
        });
        jQuery("#huge_it_slideshow_left_1").css({
            'display': 'inline'
        });
    }, function () {
        jQuery("#huge_it_slideshow_right_1").css({
            'display': 'none'
        });
        jQuery("#huge_it_slideshow_left_1").css({
            'display': 'none'
        });
    });
    var pausehover = "on";
    if (pausehover == "on") {
        jQuery("#huge_it_slideshow_image_container_1, .huge_it_slideshow_image_container_1").hover(function () {
            window.clearInterval(huge_interval['huge_it_playInterval_' + 1]);
        }, function () {
            window.clearInterval(huge_interval['huge_it_playInterval_' + 1]);
            play_1();
        });
    }
    play_1();
});

function play_1() {
    huge_interval['huge_it_playInterval_' + 1] = setInterval(function () {
        var iterator = 1;
        huge_it_change_image_1(parseInt(jQuery('#huge_it_current_image_key_1').val()), (parseInt(jQuery('#huge_it_current_image_key_1').val()) + iterator) % data_1.length, data_1, false, false);
    }, '5000');
}

jQuery(window).focus(function () {
    var i_1 = 0;
    jQuery(".huge_it_slider_1").children("div").each(function () {
        if (jQuery(this).css('opacity') == 1) {
            jQuery("#huge_it_current_image_key_1").val(i_1);
        }
        i_1++;
    });
});
jQuery(window).blur(function () {
    console.log(event_stack_1);
    window.clearInterval(huge_interval['huge_it_playInterval_' + 1]);
});
jQuery(window).focus(function () {
    play_1()
});
var YTdeferred = jQuery.Deferred();
window.onYouTubeIframeAPIReady = function () {
    //resolve when youtube callback is called passing YT as a parameter
    YTdeferred.resolve(window.YT);

};
YTdeferred.done(function (YT) {

    jQuery('.huge-it-iframe').each(function () {

        var el_id = jQuery(this).attr('data-element-id');
        var volume = HUGEIT_YT_IFRAMES['iframe' + el_id]['volume'];

        window['onPlayerReady' + el_id] = function (event) {
            window['player_' + el_id]['setVolume'](volume);
        }
    });

    jQuery('.huge-it-iframe').each(function () {

        var id = jQuery(this).attr('id');
        var el_id = jQuery(this).attr('data-element-id');
        var controls = HUGEIT_YT_IFRAMES['iframe' + el_id]['controls'];
        var showinfo = HUGEIT_YT_IFRAMES['iframe' + el_id]['showinfo'];
        var url = HUGEIT_YT_IFRAMES['iframe' + el_id]['videoId'];
        controls || (controls = 0);
        showinfo || (showinfo = 0);

        window['player_' + el_id] = new YT.Player(id, {
            height: '500',
            width: '1360',
            videoId: url,
            playerVars: {
                'controls': controls, // 0,           
                'showinfo': showinfo, //0,
                'rel': 0
            },
            events: {
                'onError': window['onPlayerError' + el_id],
                'onReady': window['onPlayerReady' + el_id],
                'onStateChange': window['onPlayerStateChange' + el_id],
                'loop': 1
            }
        });
    })
});

jQuery(function () {

    jQuery('.huge-it-iframe').each(function () {

        var el_id = jQuery(this).attr('data-element-id');
        var quality = HUGEIT_YT_IFRAMES['iframe' + el_id]['quality'];

        window['onPlayerStateChange' + el_id] = function (event) {

            if (event.data == YT.PlayerState.PLAYING) {
                HUGEIT_YT_IFRAMES['iframe' + el_id]['state'] = 'played';
                event.target.setPlaybackQuality(quality);
            }
        }
    });

});

function stopYoutubeVideo(currentVideo, nextVideo) {

    if (currentVideo) {
        (HUGEIT_YT_IFRAMES['iframe' + currentVideo]['state']) ? currentVideo && (window['player_' + currentVideo]['pauseVideo']()): currentVideo && (window['player_' + currentVideo]['stopVideo']());
    }
    nextVideo && HUGEIT_YT_IFRAMES['iframe' + nextVideo]['autoplay'] && (window['player_' + nextVideo]['playVideo']());
}

function stopVimeoVideo(currentVideo, nextVideo) {
    jQuery(currentVideo).vimeo('pause');
    jQuery(nextVideo).vimeo('play');
}
/*** <Vimeo> initialize And youtube autopay ***/

jQuery(window).load(function () {

    (function VimeoOptionsReady() { //calling funtion once
        jQuery('.huge-it-iframe-vimeo').each(function () {
            var el_id = jQuery(this).attr('data-element-id');
            jQuery(this).vimeo('setColor', HUGEIT_VIMEOS['iframe' + el_id]['color']);
            jQuery(this).vimeo('setVolume', HUGEIT_VIMEOS['iframe' + el_id]['volume']);
        })
    }());

    if ('off' == 'on') {


        if (jQuery('.huge-it-iframe-vimeo.autoplay').length) {

            (function AutoplayVimeo() {
                var setplayVideo = setInterval(hugeitframe, 100);

                function hugeitframe() {
                    var vimeo1 = jQuery('.huge_it_slider_1 li').first().find('.autoplay')
                    if (vimeo1.length) {
                        vimeo1.vimeo('play');
                        clearInterval(setplayVideo);
                    }
                };
            }());
        };

        if (jQuery('.huge-it-iframe.autoplay').length) {

            (function AutoplayYoutube() {
                var setplayVideo = setInterval(hugeitframe, 100);

                function hugeitframe() {
                    jQuery('.huge-it-iframe.autoplay').each(function () {

                        var el_id = jQuery(this).attr('data-element-id');

                        if (window['player_' + el_id]) {
                            window['player_' + el_id]['playVideo']();
                            clearInterval(setplayVideo);
                        }
                    });
                }
            }());
        };

    }
});
jQuery(document).ready(function ($) {
    setInterval(function () {
        jQuery('.huge_it_slider_1').find("li").each(function () {
            if ($(this).css("opacity") == "1") {
                var img_id = $(this).attr('id');
                jQuery('.huge_it_slideshow_thumbs_1').each(function () {
                    //if ($(this).hasClass('bx-clone')){$(this).removeAttr('id')}
                    var allListElements = $('li[id=' + img_id + ']');
                    $(this).find(allListElements).not(".bx-clone").each(function () {
                        jQuery('.huge_it_slideshow_thumbs_1 li').find(".trans_back").css('background', 'rgba(255,255,255,0.3)');
                        $(this).find('.trans_back').css('background', 'none');
                    })
                })
            }
        })
    }, 100)
})