const intro = document.querySelector(".intro");
const video = intro.querySelector("video");
const text = intro.querySelector("h1");
//END SECTION
const section = document.querySelector("section");
const end = section.querySelector("h1");


//SCROLLMAGIC
const controller = new ScrollMagic.Controller();

//SCENES
const scene = new ScrollMagic.Scene({
    duration: 3500,
    triggerElement: intro,
    triggerHook: 0
})
    .setPin(intro)
    .addTo(controller);


//TEXT ANIMATION
const textAnim = TweenMax.fromTo(text, 9, {opacity: 1}, {opacity: 0});

let scene2 = new ScrollMagic.Scene({
    duration: 3500,
    triggerElement: intro,
    triggerHook: 0
})
    .setTween(textAnim)
    .addTo(controller);

//VIDEO ANIMATION
let accelAmount = 0.1;
let scrollpos = 0;
let delay = 0;

scene.on('update', e => {
    scrollpos = e.scrollPos / 1000;
});

setInterval(() => {
    delay += (scrollpos - delay) * accelAmount;
    video.currentTime = delay;
}, 33.3);