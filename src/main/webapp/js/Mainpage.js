/**
 * Created by Zwe Htat Naing on 08/12/2016.
 */
$(function(){
    $.StartScreen();

    var tiles = $(".tile, .tile-small, .tile-sqaure, .tile-wide, .tile-large, .tile-big, .tile-super");

    $.each(tiles, function(){
        var tile = $(this);
        setTimeout(function(){
            tile.css({
                opacity: 1,
                "-webkit-transform": "scale(1)",
                "transform": "scale(1)",
                "-webkit-transition": ".3s",
                "transition": ".3s"
            });
        }, Math.floor(Math.random()*500));
    });

    $(".tile-group").animate({
        left: 0
    });
});