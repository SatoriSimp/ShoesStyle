let midSole = document.querySelector(".midSole"),
    sockLining = document.querySelector(".sockLining"),
    collar = document.querySelectorAll(".collar"),
    upperEyestay = document.querySelector(".upperEyestay"),
    eyestay = document.querySelectorAll(".eyestay"),
    lowerEyestay = document.querySelector(".lowerEyestay"),
    heel = document.querySelector(".heel"),
    toeBox = document.querySelector(".toeBox"),
    tip = document.querySelector(".tip"),
    quarter = document.querySelector(".quarter"),
    swoosh = document.querySelector(".swoosh"),
    lace = document.querySelectorAll(".lace"),
    tongue = document.querySelectorAll(".tongue"),
    tongueRim = document.querySelector(".tongueRim"),
    tongueTag = document.querySelector(".tongueTag"),
    outSole = document.querySelectorAll(".outSole")

let midSoleColor = document.getElementById("midSoleColor"),
    sockLiningColor = document.getElementById("sockLiningColor"),
    collarColor = document.getElementById("collarColor"),
    upperEyestayColor = document.getElementById("upperEyestayColor"),
    eyestayColor = document.getElementById("eyestayColor"),
    lowerEyestayColor = document.getElementById("lowerEyestayColor"),
    heelColor = document.getElementById("heelColor"),
    toeBoxColor = document.getElementById("toeBoxColor"),
    tipColor = document.getElementById("tipColor"),
    quarterColor = document.getElementById("quarterColor"),
    swooshColor = document.getElementById("swooshColor"),
    laceColor = document.getElementById("laceColor"),
    tongueColor = document.getElementById("tongueColor"),
    tongueRimColor = document.getElementById("tongueRimColor"),
    tongueTagColor = document.getElementById("tongueTagColor"),
    outsoleColor = document.getElementById("outsoleColor")

midSoleColor.addEventListener("input", () => {
    midSole.style.fill = midSoleColor.value;
    document.getElementById("midSoleColorWrapper").style.backgroundColor = midSoleColor.value;
})

sockLiningColor.addEventListener("input", () => {
    sockLining.style.fill = sockLiningColor.value;
    document.getElementById("sockLiningColorWrapper").style.backgroundColor = sockLiningColor.value;
})

collar.forEach(item => collarColor.addEventListener("input", () => {
    item.style.fill = collarColor.value;
    document.getElementById("collarColorWrapper").style.backgroundColor = collarColor.value;
}))


upperEyestayColor.addEventListener("input", () => {
    upperEyestay.style.fill = upperEyestayColor.value;
    document.getElementById("upperEyestayColorWrapper").style.backgroundColor = upperEyestayColor.value;
})

eyestay.forEach(item => eyestayColor.addEventListener("input", () => {
    item.style.fill = eyestayColor.value;
    document.getElementById("eyestayColorWrapper").style.backgroundColor = eyestayColor.value;
}))

lowerEyestayColor.addEventListener("input", () => {
    lowerEyestay.style.fill = lowerEyestayColor.value;
    document.getElementById("lowerEyestayColorWrapper").style.backgroundColor = lowerEyestayColor.value;
})

heelColor.addEventListener("input", () => {
    heel.style.fill = heelColor.value;
    document.getElementById("heelColorWrapper").style.backgroundColor = heelColor.value;
})

toeBoxColor.addEventListener("input", () => {
    toeBox.style.fill = toeBoxColor.value;
    document.getElementById("toeBoxColorWrapper").style.backgroundColor = toeBoxColor.value;
})

tipColor.addEventListener("input", () => {
    tip.style.fill = tipColor.value;
    document.getElementById("tipColorWrapper").style.backgroundColor = tipColor.value;
})

quarterColor.addEventListener("input", () => {
    quarter.style.fill = quarterColor.value;
    document.getElementById("quarterColorWrapper").style.backgroundColor = quarterColor.value;
})

swooshColor.addEventListener("input", () => {
    swoosh.style.fill = swooshColor.value;
    document.getElementById("swooshColorWrapper").style.backgroundColor = swooshColor.value;
})

lace.forEach(item => laceColor.addEventListener("input", () => {
    item.style.fill = laceColor.value;
    document.getElementById("laceColorWrapper").style.backgroundColor = laceColor.value;
}))

tongue.forEach(item => tongueColor.addEventListener("input", () => {
    item.style.fill = tongueColor.value;
    document.getElementById("tongueColorWrapper").style.backgroundColor = tongueColor.value;
}))

tongueRimColor.addEventListener("input", () => {
    tongueRim.style.fill = tongueRimColor.value;
    document.getElementById("tongueRimColorWrapper").style.backgroundColor = tongueRimColor.value;
})

tongueTagColor.addEventListener("input", () => {
    tongueTag.style.fill = tongueTagColor.value;
    document.getElementById("tongueTagColorWrapper").style.backgroundColor = tongueTagColor.value;
})

outSole.forEach(item => outsoleColor.addEventListener("input", () => {
    item.style.fill = outsoleColor.value;
    document.getElementById("outsoleColorWrapper").style.backgroundColor = outsoleColor.value;
}))

