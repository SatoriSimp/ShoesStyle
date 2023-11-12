let quarterDunkLow = document.querySelector(".quarterDunkLow"),
    collarDunkLow = document.querySelector(".collarDunkLow"),
    heelBaseDunkLow = document.querySelectorAll(".heelBaseDunkLow"),
    heelDunkLow = document.querySelectorAll(".heelDunkLow"),
    heelTagDunkLow = document.querySelector(".heelTagDunkLow"),
    swooshDunkLow = document.querySelector(".swooshDunkLow"),
    tipDunkLow = document.querySelector(".tipDunkLow"),
    eyestayDunkLow = document.querySelector(".eyestayDunkLow"),
    sockLiningDunkLow = document.querySelector(".sockLiningDunkLow"),
    tongueDunkLow = document.querySelectorAll(".tongueDunkLow"),
    tongueRimDunkLow = document.querySelector(".tongueRimDunkLow"),
    tongueTagDunkLow = document.querySelector(".tongueTagDunkLow"),
    toeBoxDunkLow = document.querySelector(".toeBoxDunkLow"),
    laceDunkLow = document.querySelectorAll(".laceDunkLow"),
    midSoleDunkLow = document.querySelector(".midSoleDunkLow"),
    outSoleDunkLow = document.querySelector(".outSoleDunkLow")

let quarterDunkLowColor = document.getElementById("quarterDunkLowColor"),
    collarDunkLowColor = document.getElementById("collarDunkLowColor"),
    heelBaseDunkLowColor = document.getElementById("heelBaseDunkLowColor"),
    heelDunkLowColor = document.getElementById("heelDunkLowColor"),
    heelTagDunkLowColor = document.getElementById("heelTagDunkLowColor"),
    swooshDunkLowColor = document.getElementById("swooshDunkLowColor"),
    tipDunkLowColor = document.getElementById("tipDunkLowColor"),
    eyestayDunkLowColor = document.getElementById("eyestayDunkLowColor"),
    sockLiningDunkLowColor = document.getElementById("sockLiningDunkLowColor"),
    tongueDunkLowColor = document.getElementById("tongueDunkLowColor"),
    tongueRimDunkLowColor = document.getElementById("tongueRimDunkLowColor"),
    tongueTagDunkLowColor = document.getElementById("tongueTagDunkLowColor"),
    toeBoxDunkLowColor = document.getElementById("toeBoxDunkLowColor"),
    laceDunkLowColor = document.getElementById("laceDunkLowColor"),
    midSoleDunkLowColor = document.getElementById("midSoleDunkLowColor"),
    outSoleDunkLowColor = document.getElementById("outSoleDunkLowColor")

quarterDunkLowColor.addEventListener("input", () => {
    quarterDunkLow.style.fill = quarterDunkLowColor.value;
    document.getElementById("quarterDunkLowColorWrapper").style.backgroundColor = quarterDunkLowColor.value;
})

collarDunkLowColor.addEventListener("input", () => {
    collarDunkLow.style.fill = collarDunkLowColor.value;
    document.getElementById("collarDunkLowColorWrapper").style.backgroundColor = collarDunkLowColor.value;
})

heelBaseDunkLow.forEach(item => heelBaseDunkLowColor.addEventListener("input", () => {
    item.style.fill = heelBaseDunkLowColor.value;
    document.getElementById("heelBaseDunkLowColorWrapper").style.backgroundColor = heelBaseDunkLowColor.value;
}))

heelDunkLow.forEach(item => heelDunkLowColor.addEventListener("input", () => {
    item.style.fill = heelDunkLowColor.value;
    document.getElementById("heelDunkLowColorWrapper").style.backgroundColor = heelDunkLowColor.value;
}))

heelTagDunkLowColor.addEventListener("input", () => {
    heelTagDunkLow.style.fill = heelTagDunkLowColor.value;
    document.getElementById("heelTagDunkLowColorWrapper").style.backgroundColor = heelTagDunkLowColor.value;
})


swooshDunkLowColor.addEventListener("input", () => {
    swooshDunkLow.style.fill = swooshDunkLowColor.value;
    document.getElementById("swooshDunkLowColorWrapper").style.backgroundColor = swooshDunkLowColor.value;
})

tipDunkLowColor.addEventListener("input", () => {
    tipDunkLow.style.fill = tipDunkLowColor.value;
    document.getElementById("tipDunkLowColorWrapper").style.backgroundColor = tipDunkLowColor.value;
})

eyestayDunkLowColor.addEventListener("input", () => {
    eyestayDunkLow.style.fill = eyestayDunkLowColor.value;
    document.getElementById("eyestayDunkLowColorWrapper").style.backgroundColor = eyestayDunkLowColor.value;
})

sockLiningDunkLowColor.addEventListener("input", () => {
    sockLiningDunkLow.style.fill = sockLiningDunkLowColor.value;
    document.getElementById("sockLiningDunkLowColorWrapper").style.backgroundColor = sockLiningDunkLowColor.value;
})

tongueDunkLow.forEach(item => tongueDunkLowColor.addEventListener("input", () => {
    item.style.fill = tongueDunkLowColor.value;
    document.getElementById("tongueDunkLowColorWrapper").style.backgroundColor = tongueDunkLowColor.value;
}))

tongueRimDunkLowColor.addEventListener("input", () => {
    tongueRimDunkLow.style.fill = tongueRimDunkLowColor.value;
    document.getElementById("tongueRimDunkLowColorWrapper").style.backgroundColor = tongueRimDunkLowColor.value;
})

tongueTagDunkLowColor.addEventListener("input", () => {
    tongueTagDunkLow.style.fill = tongueTagDunkLowColor.value;
    document.getElementById("tongueTagDunkLowColorWrapper").style.backgroundColor = tongueTagDunkLowColor.value;
})

toeBoxDunkLowColor.addEventListener("input", () => {
    toeBoxDunkLow.style.fill = toeBoxDunkLowColor.value;
    document.getElementById("toeBoxDunkLowColorWrapper").style.backgroundColor = toeBoxDunkLowColor.value;
})

laceDunkLow.forEach(item => laceDunkLowColor.addEventListener("input", () => {
    item.style.fill = laceDunkLowColor.value;
    document.getElementById("laceDunkLowColorWrapper").style.backgroundColor = laceDunkLowColor.value;
}))

midSoleDunkLowColor.addEventListener("input", () => {
    midSoleDunkLow.style.fill = midSoleDunkLowColor.value;
    document.getElementById("midSoleDunkLowColorWrapper").style.backgroundColor = midSoleDunkLowColor.value;
})

outSoleDunkLowColor.addEventListener("input", () => {
    outSoleDunkLow.style.fill = outSoleDunkLowColor.value;
    document.getElementById("outSoleDunkLowColorWrapper").style.backgroundColor = outSoleDunkLowColor.value;
})

