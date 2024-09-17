
function setVideoSize() {
    const vidWidth = 1920;
    const vidHeight = 1080;
    const windowWidth = window.innerWidth;
    const windowHeight = window.innerHeight;
    const tempVidWidth = windowHeight * vidWidth / vidHeight;
    const tempVidHeight = windowWidth * vidHeight / vidWidth;
    const newVidWidth = tempVidWidth > windowWidth ? tempVidWidth : windowWidth;
    const newVidHeight = tempVidHeight > windowHeight ? tempVidHeight : windowHeight;
    const tmVideo = $('#tm-video');

    tmVideo.css('width', newVidWidth);
    tmVideo.css('height', newVidHeight);
}


/************** Video background *********/

setVideoSize();

// Set video background size based on window size
let timeout;
window.onresize = function () {
    clearTimeout(timeout);
    timeout = setTimeout(setVideoSize, 100);
};

// Play/Pause button for video background      
const btn = $("#tm-video-control-button");

btn.on("click", function (e) {
    const video = document.getElementById("tm-video");
    $(this).removeClass();

    if (video.paused) {
        video.play();
        $(this).addClass("fas fa-pause");
    } else {
        video.pause();
        $(this).addClass("fas fa-play");
    }
});