let collarAirMax90 = document.querySelector(".collarAirMax90"),
    toeBoxAirMax90 = document.querySelector(".toeBoxAirMax90"),
    bodyOverlayAirMax90 = document.querySelectorAll(".bodyOverlayAirMax90"),
    swooshAirMax90 = document.querySelector(".swooshAirMax90"),
    bodySideAirMax90 = document.querySelector(".bodySideAirMax90"),
    sockLiningAirMax90 = document.querySelector(".sockLiningAirMax90"),
    eyestayAirMax90 = document.querySelector(".eyestayAirMax90"),
    upperEyestayAirMax90 = document.querySelectorAll(".upperEyestayAirMax90"),
    lowerEyestayAirMax90 = document.querySelectorAll(".lowerEyestayAirMax90"),
    heelAirMax90 = document.querySelector(".heelAirMax90"),
    sideAccentAirMax90 = document.querySelectorAll(".sideAccentAirMax90"),
    tongueAirMax90 = document.querySelectorAll(".tongueAirMax90"),
    tongueRimAirMax90 = document.querySelector(".tongueRimAirMax90"),
    tongueTagAirMax90 = document.querySelector(".tongueTagAirMax90"),
    midSoleAirMax90 = document.querySelectorAll(".midSoleAirMax90"),
    midSoleAccentAirMax90 = document.querySelector(".midSoleAccentAirMax90"),
    outSoleAirMax90 = document.querySelectorAll(".outSoleAirMax90"),
    laceAirMax90 = document.querySelectorAll(".laceAirMax90")

let collarAirMax90Color = document.getElementById("collarAirMax90Color"),
    toeBoxAirMax90Color = document.getElementById("toeBoxAirMax90Color"),
    bodyOverlayAirMax90Color = document.getElementById("bodyOverlayAirMax90Color"),
    swooshAirMax90Color = document.getElementById("swooshAirMax90Color"),
    bodySideAirMax90Color = document.getElementById("bodySideAirMax90Color"),
    sockLiningAirMax90Color = document.getElementById("sockLiningAirMax90Color"),
    eyestayAirMax90Color = document.getElementById("eyestayAirMax90Color"),
    upperEyestayAirMax90Color = document.getElementById("upperEyestayAirMax90Color"),
    lowerEyestayAirMax90Color = document.getElementById("lowerEyestayAirMax90Color"),
    heelAirMax90Color = document.getElementById("heelAirMax90Color"),
    sideAccentAirMax90Color = document.getElementById("sideAccentAirMax90Color"),
    tongueAirMax90Color = document.getElementById("tongueAirMax90Color"),
    tongueRimAirMax90Color = document.getElementById("tongueRimAirMax90Color"),
    tongueTagAirMax90Color = document.getElementById("tongueTagAirMax90Color"),
    midSoleAirMax90Color = document.getElementById("midSoleAirMax90Color"),
    midSoleAccentAirMax90Color = document.getElementById("midSoleAccentAirMax90Color"),
    outSoleAirMax90Color = document.getElementById("outSoleAirMax90Color"),
    laceAirMax90Color = document.getElementById("laceAirMax90Color")

collarAirMax90Color.addEventListener("input", () => {
    collarAirMax90.style.fill = collarAirMax90Color.value;
    document.getElementById("collarAirMax90ColorWrapper").style.backgroundColor = collarAirMax90Color.value;
})

toeBoxAirMax90Color.addEventListener("input", () => {
    toeBoxAirMax90.style.fill = toeBoxAirMax90Color.value;
    document.getElementById("toeBoxAirMax90ColorWrapper").style.backgroundColor = toeBoxAirMax90Color.value;
})

bodyOverlayAirMax90.forEach(item => bodyOverlayAirMax90Color.addEventListener("input", () => {
    item.style.fill = bodyOverlayAirMax90Color.value;
    document.getElementById("bodyOverlayAirMax90ColorWrapper").style.backgroundColor = bodyOverlayAirMax90Color.value;
}))

swooshAirMax90Color.addEventListener("input", () => {
    swooshAirMax90.style.fill = swooshAirMax90Color.value;
    document.getElementById("swooshAirMax90ColorWrapper").style.backgroundColor = swooshAirMax90Color.value;
})

bodySideAirMax90Color.addEventListener("input", () => {
    bodySideAirMax90.style.fill = bodySideAirMax90Color.value;
    document.getElementById("bodySideAirMax90ColorWrapper").style.backgroundColor = bodySideAirMax90Color.value;
})

sockLiningAirMax90Color.addEventListener("input", () => {
    sockLiningAirMax90.style.fill = sockLiningAirMax90Color.value;
    document.getElementById("sockLiningAirMax90ColorWrapper").style.backgroundColor = sockLiningAirMax90Color.value;
})

eyestayAirMax90Color.addEventListener("input", () => {
    eyestayAirMax90.style.fill = eyestayAirMax90Color.value;
    document.getElementById("eyestayAirMax90ColorWrapper").style.backgroundColor = eyestayAirMax90Color.value;
})

upperEyestayAirMax90.forEach(item => upperEyestayAirMax90Color.addEventListener("input", () => {
    item.style.fill = upperEyestayAirMax90Color.value;
    document.getElementById("upperEyestayAirMax90ColorWrapper").style.backgroundColor = upperEyestayAirMax90Color.value;
}))

lowerEyestayAirMax90.forEach(item => lowerEyestayAirMax90Color.addEventListener("input", () => {
    item.style.fill = lowerEyestayAirMax90Color.value;
    document.getElementById("lowerEyestayAirMax90ColorWrapper").style.backgroundColor = lowerEyestayAirMax90Color.value;
}))


heelAirMax90Color.addEventListener("input", () => {
    heelAirMax90.style.fill = heelAirMax90Color.value;
    document.getElementById("heelAirMax90ColorWrapper").style.backgroundColor = heelAirMax90Color.value;
})

sideAccentAirMax90.forEach(item => sideAccentAirMax90Color.addEventListener("input", () => {
    item.style.fill = sideAccentAirMax90Color.value;
    document.getElementById("sideAccentAirMax90ColorWrapper").style.backgroundColor = sideAccentAirMax90Color.value;
}))

tongueAirMax90.forEach(item => tongueAirMax90Color.addEventListener("input", () => {
    item.style.fill = tongueAirMax90Color.value;
    document.getElementById("tongueAirMax90ColorWrapper").style.backgroundColor = tongueAirMax90Color.value;
}))

tongueRimAirMax90Color.addEventListener("input", () => {
    tongueRimAirMax90.style.fill = tongueRimAirMax90Color.value;
    document.getElementById("tongueRimAirMax90ColorWrapper").style.backgroundColor = tongueRimAirMax90Color.value;
})

tongueTagAirMax90Color.addEventListener("input", () => {
    tongueTagAirMax90.style.fill = tongueTagAirMax90Color.value;
    document.getElementById("tongueTagAirMax90ColorWrapper").style.backgroundColor = tongueTagAirMax90Color.value;
})

midSoleAirMax90.forEach(item => midSoleAirMax90Color.addEventListener("input", () => {
    item.style.fill = midSoleAirMax90Color.value;
    document.getElementById("midSoleAirMax90ColorWrapper").style.backgroundColor = midSoleAirMax90Color.value;
}))

midSoleAccentAirMax90Color.addEventListener("input", () => {
    midSoleAccentAirMax90.style.fill = midSoleAccentAirMax90Color.value;
    document.getElementById("midSoleAccentAirMax90ColorWrapper").style.backgroundColor = midSoleAccentAirMax90Color.value;
})

outSoleAirMax90.forEach(item => outSoleAirMax90Color.addEventListener("input", () => {
    item.style.fill = outSoleAirMax90Color.value;
    document.getElementById("outSoleAirMax90ColorWrapper").style.backgroundColor = outSoleAirMax90Color.value;
}))

laceAirMax90.forEach(item => laceAirMax90Color.addEventListener("input", () => {
    item.style.fill = laceAirMax90Color.value;
    document.getElementById("laceAirMax90ColorWrapper").style.backgroundColor = laceAirMax90Color.value;
}))

