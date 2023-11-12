let foxingVans = document.querySelectorAll(".foxingVans"),
    heelLableVans = document.querySelector(".heelLableVans"),
    foxingLineVans = document.querySelector(".foxingLineVans"),
    vampVans = document.querySelector(".vampVans"),
    heelVans = document.querySelector(".heelVans"),
    quarterVans = document.querySelectorAll(".quarterVans"),
    innerLiningVans = document.querySelector(".innerLiningVans"),
    emblemVans = document.querySelector(".emblemVans"),
    eyestayVans = document.querySelector(".eyestayVans"),
    tongueVans = document.querySelector(".tongueVans"),
    laceVans = document.querySelectorAll(".laceVans")

let foxingVansColor = document.getElementById("foxingVansColor"),
    heelLableVansColor = document.getElementById("heelLableVansColor"),
    foxingLineVansColor = document.getElementById("foxingLineVansColor"),
    vampVansColor = document.getElementById("vampVansColor"),
    heelVansColor = document.getElementById("heelVansColor"),
    quarterVansColor = document.getElementById("quarterVansColor"),
    innerLiningVansColor = document.getElementById("innerLiningVansColor"),
    emblemVansColor = document.getElementById("emblemVansColor"),
    eyestayVansColor = document.getElementById("eyestayVansColor"),
    tongueVansColor = document.getElementById("tongueVansColor"),
    laceVansColor = document.getElementById("laceVansColor")


foxingVans.forEach(item => foxingVansColor.addEventListener("input", () => {
    item.style.fill = foxingVansColor.value;
    document.getElementById("foxingVansColorWrapper").style.backgroundColor = foxingVansColor.value;
}))

heelLableVansColor.addEventListener("input", () => {
    heelLableVans.style.fill = heelLableVansColor.value;
    document.getElementById("heelLableVansColorWrapper").style.backgroundColor = heelLableVansColor.value;
})

foxingLineVansColor.addEventListener("input", () => {
    foxingLineVans.style.fill = foxingLineVansColor.value;
    document.getElementById("foxingLineVansColorWrapper").style.backgroundColor = foxingLineVansColor.value;
})

vampVansColor.addEventListener("input", () => {
    vampVans.style.fill = vampVansColor.value;
    document.getElementById("vampVansColorWrapper").style.backgroundColor = vampVansColor.value;
})

heelVansColor.addEventListener("input", () => {
    heelVans.style.fill = heelVansColor.value;
    document.getElementById("heelVansColorWrapper").style.backgroundColor = heelVansColor.value;
})

quarterVans.forEach(item => quarterVansColor.addEventListener("input", () => {
    item.style.fill = quarterVansColor.value;
    document.getElementById("quarterVansColorWrapper").style.backgroundColor = quarterVansColor.value;
}))

innerLiningVansColor.addEventListener("input", () => {
    innerLiningVans.style.fill = innerLiningVansColor.value;
    document.getElementById("innerLiningVansColorWrapper").style.backgroundColor = innerLiningVansColor.value;
})

emblemVansColor.addEventListener("input", () => {
    emblemVans.style.fill = emblemVansColor.value;
    document.getElementById("emblemVansColorWrapper").style.backgroundColor = emblemVansColor.value;
})

eyestayVansColor.addEventListener("input", () => {
    eyestayVans.style.fill = eyestayVansColor.value;
    document.getElementById("eyestayVansColorWrapper").style.backgroundColor = eyestayVansColor.value;
})

tongueVansColor.addEventListener("input", () => {
    tongueVans.style.fill = tongueVansColor.value;
    document.getElementById("tongueVansColorWrapper").style.backgroundColor = tongueVansColor.value;
})

laceVans.forEach(item => laceVansColor.addEventListener("input", () => {
    item.style.fill = laceVansColor.value;
    document.getElementById("laceVansColorWrapper").style.backgroundColor = laceVansColor.value;
}))


