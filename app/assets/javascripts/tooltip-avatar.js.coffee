# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ -> $("#tooltipsy img[title]").tooltipsy({
    track: true,
    delay: 0,
    showURL: false,
    opacity: 1,
    fixPNG: true,
    showBody: " - ",
    extraClass: "pretty fancy",
    top: -15,
    left: 5
})
