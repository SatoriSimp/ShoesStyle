let bodyAirmax1 = document.querySelectorAll(".bodyAirmax1"),
    bodyLayerAirmax1 = document.querySelectorAll(".bodyLayerAirmax1"),
    bodyWrapAroundAirmax1 = document.querySelectorAll(".bodyWrapAroundAirmax1"),
    swooshAirmax1 = document.querySelector(".swooshAirmax1"),
    sockLiningAirmax1 = document.querySelectorAll(".sockLiningAirmax1"),
    eyeletAirmax1 = document.querySelector(".eyeletAirmax1"),
    tongueAirmax1 = document.querySelectorAll(".tongueAirmax1"),
    tongueRimAirmax1 = document.querySelector(".tongueRimAirmax1"),
    tongueTagAirmax1 = document.querySelector(".tongueTagAirmax1"),
    laceAirmax1 = document.querySelectorAll(".laceAirmax1"),
    midSoleAirmax1 = document.querySelector(".midSoleAirmax1"),
    outSoleAirmax1 = document.querySelectorAll(".outSoleAirmax1")

let bodyAirmax1Color = document.getElementById("bodyAirmax1Color"),
    bodyLayerAirmax1Color = document.getElementById("bodyLayerAirmax1Color"),
    bodyWrapAroundAirmax1Color = document.getElementById("bodyWrapAroundAirmax1Color"),
    swooshAirmax1Color = document.getElementById("swooshAirmax1Color"),
    sockLiningAirmax1Color = document.getElementById("sockLiningAirmax1Color"),
    eyeletAirmax1Color = document.getElementById("eyeletAirmax1Color"),
    tongueAirmax1Color = document.getElementById("tongueAirmax1Color"),
    tongueRimAirmax1Color = document.getElementById("tongueRimAirmax1Color"),
    tongueTagAirmax1Color = document.getElementById("tongueTagAirmax1Color"),
    laceAirmax1Color = document.getElementById("laceAirmax1Color"),
    midSoleAirmax1Color = document.getElementById("midSoleAirmax1Color"),
    outSoleAirmax1Color = document.getElementById("outSoleAirmax1Color")

bodyAirmax1.forEach(item => bodyAirmax1Color.addEventListener("input", () => {
    item.style.fill = bodyAirmax1Color.value;
    document.getElementById("bodyAirmax1ColorWrapper").style.backgroundColor = bodyAirmax1Color.value;
}))

bodyLayerAirmax1.forEach(item => bodyLayerAirmax1Color.addEventListener("input", () => {
    item.style.fill = bodyLayerAirmax1Color.value;
    document.getElementById("bodyLayerAirmax1ColorWrapper").style.backgroundColor = bodyLayerAirmax1Color.value;
}))

bodyWrapAroundAirmax1.forEach(item => bodyWrapAroundAirmax1Color.addEventListener("input", () => {
    item.style.fill = bodyWrapAroundAirmax1Color.value;
    document.getElementById("bodyWrapAroundAirmax1ColorWrapper").style.backgroundColor = bodyWrapAroundAirmax1Color.value;
}))

swooshAirmax1Color.addEventListener("input", () => {
    swooshAirmax1.style.fill = swooshAirmax1Color.value;
    document.getElementById("swooshAirmax1ColorWrapper").style.backgroundColor = swooshAirmax1Color.value;
})

sockLiningAirmax1.forEach(item => sockLiningAirmax1Color.addEventListener("input", () => {
    item.style.fill = sockLiningAirmax1Color.value;
    document.getElementById("sockLiningAirmax1ColorWrapper").style.backgroundColor = sockLiningAirmax1Color.value;
}))

eyeletAirmax1Color.addEventListener("input", () => {
    eyeletAirmax1.style.fill = eyeletAirmax1Color.value;
    document.getElementById("eyeletAirmax1ColorWrapper").style.backgroundColor = eyeletAirmax1Color.value;
})

tongueAirmax1.forEach(item => tongueAirmax1Color.addEventListener("input", () => {
    item.style.fill = tongueAirmax1Color.value;
    document.getElementById("tongueAirmax1ColorWrapper").style.backgroundColor = tongueAirmax1Color.value;
}))

tongueRimAirmax1Color.addEventListener("input", () => {
    tongueRimAirmax1.style.fill = tongueRimAirmax1Color.value;
    document.getElementById("tongueRimAirmax1ColorWrapper").style.backgroundColor = tongueRimAirmax1Color.value;
})

tongueTagAirmax1Color.addEventListener("input", () => {
    tongueTagAirmax1.style.fill = tongueTagAirmax1Color.value;
    document.getElementById("tongueTagAirmax1ColorWrapper").style.backgroundColor = tongueTagAirmax1Color.value;
})

laceAirmax1.forEach(item => laceAirmax1Color.addEventListener("input", () => {
    item.style.fill = laceAirmax1Color.value;
    document.getElementById("laceAirmax1ColorWrapper").style.backgroundColor = laceAirmax1Color.value;
}))

midSoleAirmax1Color.addEventListener("input", () => {
    midSoleAirmax1.style.fill = midSoleAirmax1Color.value;
    document.getElementById("midSoleAirmax1ColorWrapper").style.backgroundColor = midSoleAirmax1Color.value;
})

outSoleAirmax1.forEach(item => outSoleAirmax1Color.addEventListener("input", () => {
    item.style.fill = outSoleAirmax1Color.value;
    document.getElementById("outSoleAirmax1ColorWrapper").style.backgroundColor = outSoleAirmax1Color.value;
}))

