let bodyBlazerMid = document.querySelector(".bodyBlazerMid"),
    swooshBlazerMid = document.querySelector(".swooshBlazerMid"),
    suadeBlazerMid = document.querySelector(".suadeBlazerMid"),
    heelBlazerMid = document.querySelector(".heelBlazerMid"),
    toeBoxBlazerMid = document.querySelector(".toeBoxBlazerMid"),
    eyestayBlazerMid = document.querySelector(".eyestayBlazerMid"),
    sockLiningBlazerMid = document.querySelector(".sockLiningBlazerMid"),
    tongueBlazerMid = document.querySelectorAll(".tongueBlazerMid"),
    tongueTagBlazerMid = document.querySelector(".tongueTagBlazerMid"),
    tongueRimBlazerMid = document.querySelector(".tongueRimBlazerMid"),
    laceBlazerMid = document.querySelectorAll(".laceBlazerMid"),
    midSoleBlazerMid = document.querySelectorAll(".midSoleBlazerMid")

let bodyBlazerMidColor = document.getElementById("bodyBlazerMidColor"),
    swooshBlazerMidColor = document.getElementById("swooshBlazerMidColor"),
    suadeBlazerMidColor = document.getElementById("suadeBlazerMidColor"),
    heelBlazerMidColor = document.getElementById("heelBlazerMidColor"),
    toeBoxBlazerMidColor = document.getElementById("toeBoxBlazerMidColor"),
    eyestayBlazerMidColor = document.getElementById("eyestayBlazerMidColor"),
    sockLiningBlazerMidColor = document.getElementById("sockLiningBlazerMidColor"),
    tongueBlazerMidColor = document.getElementById("tongueBlazerMidColor"),
    tongueTagBlazerMidColor = document.getElementById("tongueTagBlazerMidColor"),
    tongueRimBlazerMidColor = document.getElementById("tongueRimBlazerMidColor"),
    laceBlazerMidColor = document.getElementById("laceBlazerMidColor"),
    midSoleBlazerMidColor = document.getElementById("midSoleBlazerMidColor")


bodyBlazerMidColor.addEventListener("input", () => {
    bodyBlazerMid.style.fill = bodyBlazerMidColor.value;
    document.getElementById("bodyBlazerMidColorWrapper").style.backgroundColor = bodyBlazerMidColor.value;
})

swooshBlazerMidColor.addEventListener("input", () => {
    swooshBlazerMid.style.fill = swooshBlazerMidColor.value;
    document.getElementById("swooshBlazerMidColorWrapper").style.backgroundColor = swooshBlazerMidColor.value;
})

suadeBlazerMidColor.addEventListener("input", () => {
    suadeBlazerMid.style.fill = suadeBlazerMidColor.value;
    document.getElementById("suadeBlazerMidColorWrapper").style.backgroundColor = suadeBlazerMidColor.value;
})

heelBlazerMidColor.addEventListener("input", () => {
    heelBlazerMid.style.fill = heelBlazerMidColor.value;
    document.getElementById("heelBlazerMidColorWrapper").style.backgroundColor = heelBlazerMidColor.value;
})

toeBoxBlazerMidColor.addEventListener("input", () => {
    toeBoxBlazerMid.style.fill = toeBoxBlazerMidColor.value;
    document.getElementById("toeBoxBlazerMidColorWrapper").style.backgroundColor = toeBoxBlazerMidColor.value;
})

eyestayBlazerMidColor.addEventListener("input", () => {
    eyestayBlazerMid.style.fill = eyestayBlazerMidColor.value;
    document.getElementById("eyestayBlazerMidColorWrapper").style.backgroundColor = eyestayBlazerMidColor.value;
})

sockLiningBlazerMidColor.addEventListener("input", () => {
    sockLiningBlazerMid.style.fill = sockLiningBlazerMidColor.value;
    document.getElementById("sockLiningBlazerMidColorWrapper").style.backgroundColor = sockLiningBlazerMidColor.value;
})

tongueBlazerMid.forEach(item => tongueBlazerMidColor.addEventListener("input", () => {
    item.style.fill = tongueBlazerMidColor.value;
    document.getElementById("tongueBlazerMidColorWrapper").style.backgroundColor = tongueBlazerMidColor.value;
}))

tongueTagBlazerMidColor.addEventListener("input", () => {
    tongueTagBlazerMid.style.fill = tongueTagBlazerMidColor.value;
    document.getElementById("tongueTagBlazerMidColorWrapper").style.backgroundColor = tongueTagBlazerMidColor.value;
})

tongueRimBlazerMidColor.addEventListener("input", () => {
    tongueRimBlazerMid.style.fill = tongueRimBlazerMidColor.value;
    document.getElementById("tongueRimBlazerMidColorWrapper").style.backgroundColor = tongueRimBlazerMidColor.value;
})

laceBlazerMid.forEach(item => laceBlazerMidColor.addEventListener("input", () => {
    item.style.fill = laceBlazerMidColor.value;
    document.getElementById("laceBlazerMidColorWrapper").style.backgroundColor = laceBlazerMidColor.value;
}))

midSoleBlazerMid.forEach(item => midSoleBlazerMidColor.addEventListener("input", () => {
    item.style.fill = midSoleBlazerMidColor.value;
    document.getElementById("midSoleBlazerMidColorWrapper").style.backgroundColor = midSoleBlazerMidColor.value;
}))


