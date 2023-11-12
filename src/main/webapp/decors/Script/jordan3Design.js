let swooshJordan3 = document.querySelector(".swooshJordan3"),
    sockLiningJordan3 = document.querySelector(".sockLiningJordan3"),
    collarJordan3 = document.querySelector(".collarJordan3"),
    bodyJordan3 = document.querySelectorAll(".bodyJordan3"),
    eyestayJordan3 = document.querySelector(".eyestayJordan3"),
    eyeletJordan3 = document.querySelectorAll(".eyeletJordan3"),
    midsoleAccentJordan3 = document.querySelector(".midsoleAccentJordan3"),
    midsoleJordan3 = document.querySelectorAll(".midsoleJordan3"),
    outsoleJordan3 = document.querySelector(".outsoleJordan3"),
    tipJordan3 = document.querySelector(".tipJordan3"),
    heelJordan3 = document.querySelector(".heelJordan3"),
    heelTabJordan3 = document.querySelectorAll(".heelTabJordan3"),
    tongueJordan3 = document.querySelectorAll(".tongueJordan3"),
    tongueRimJordan3 = document.querySelector(".tongueRimJordan3"),
    laceJordan3 = document.querySelectorAll(".laceJordan3")

let midsoleJordan3Color = document.getElementById("midsoleJordan3Color"),
    midsoleAccentJordan3Color = document.getElementById("midsoleAccentJordan3Color"),
    sockLiningJordan3Color = document.getElementById("sockLiningJordan3Color"),
    collarJordan3Color = document.getElementById("collarJordan3Color"),
    eyeletJordan3Color = document.getElementById("eyeletJordan3Color"),
    eyestayJordan3Color = document.getElementById("eyestayJordan3Color"),
    heelJordan3Color = document.getElementById("heelJordan3Color"),
    heelTabJordan3Color = document.getElementById("heelTabJordan3Color"),
    tipJordan3Color = document.getElementById("tipJordan3Color"),
    bodyJordan3Color = document.getElementById("bodyJordan3Color"),
    swooshJordan3Color = document.getElementById("swooshJordan3Color"),
    laceJordan3Color = document.getElementById("laceJordan3Color"),
    tongueJordan3Color = document.getElementById("tongueJordan3Color"),
    tongueRimJordan3Color = document.getElementById("tongueRimJordan3Color"),
    outsoleJordan3Color = document.getElementById("outsoleJordan3Color")


midsoleJordan3.forEach(item => midsoleJordan3Color.addEventListener("input", () => {
    item.style.fill = midsoleJordan3Color.value;
    document.getElementById("midsoleJordan3ColorWrapper").style.backgroundColor = midsoleJordan3Color.value;
}))

midsoleAccentJordan3Color.addEventListener("input", () => {
    midsoleAccentJordan3.style.fill = midsoleAccentJordan3Color.value;
    document.getElementById("midsoleAccentJordan3ColorWrapper").style.backgroundColor = midsoleAccentJordan3Color.value;
})

sockLiningJordan3Color.addEventListener("input", () => {
    sockLiningJordan3.style.fill = sockLiningJordan3Color.value;
    document.getElementById("sockLiningJordan3ColorWrapper").style.backgroundColor = sockLiningJordan3Color.value;
})

collarJordan3Color.addEventListener("input", () => {
    collarJordan3.style.fill = collarJordan3Color.value;
    document.getElementById("collarJordan3ColorWrapper").style.backgroundColor = collarJordan3Color.value;
})

eyeletJordan3.forEach(item => eyeletJordan3Color.addEventListener("input", () => {
    item.style.fill = eyeletJordan3Color.value;
    document.getElementById("eyeletJordan3ColorWrapper").style.backgroundColor = eyeletJordan3Color.value;
}))

eyestayJordan3Color.addEventListener("input", () => {
    eyestayJordan3.style.fill = eyestayJordan3Color.value;
    document.getElementById("eyestayJordan3ColorWrapper").style.backgroundColor = eyestayJordan3Color.value;
})

heelJordan3Color.addEventListener("input", () => {
    heelJordan3.style.fill = heelJordan3Color.value;
    document.getElementById("heelJordan3ColorWrapper").style.backgroundColor = heelJordan3Color.value;
})

heelTabJordan3.forEach(item => heelTabJordan3Color.addEventListener("input", () => {
    item.style.fill = heelTabJordan3Color.value;
    document.getElementById("heelTabJordan3ColorWrapper").style.backgroundColor = heelTabJordan3Color.value;
}))

tipJordan3Color.addEventListener("input", () => {
    tipJordan3.style.fill = tipJordan3Color.value;
    document.getElementById("tipJordan3ColorWrapper").style.backgroundColor = tipJordan3Color.value;
})

bodyJordan3.forEach(item => bodyJordan3Color.addEventListener("input", () => {
    item.style.fill = bodyJordan3Color.value;
    document.getElementById("bodyJordan3ColorWrapper").style.backgroundColor = bodyJordan3Color.value;
}))

swooshJordan3Color.addEventListener("input", () => {
    swooshJordan3.style.fill = swooshJordan3Color.value;
    document.getElementById("swooshJordan3ColorWrapper").style.backgroundColor = swooshJordan3Color.value;
})

laceJordan3.forEach(item => laceJordan3Color.addEventListener("input", () => {
    item.style.fill = laceJordan3Color.value;
    document.getElementById("laceJordan3ColorWrapper").style.backgroundColor = laceJordan3Color.value;
}))

tongueJordan3.forEach(item => tongueJordan3Color.addEventListener("input", () => {
    item.style.fill = tongueJordan3Color.value;
    document.getElementById("tongueJordan3ColorWrapper").style.backgroundColor = tongueJordan3Color.value;
}))

tongueRimJordan3Color.addEventListener("input", () => {
    tongueRimJordan3.style.fill = tongueRimJordan3Color.value;
    document.getElementById("tongueRimJordan3ColorWrapper").style.backgroundColor = tongueRimJordan3Color.value;
})

outsoleJordan3Color.addEventListener("input", () => {
    outsoleJordan3.style.fill = outsoleJordan3Color.value;
    document.getElementById("outsoleJordan3ColorWrapper").style.backgroundColor = outsoleJordan3Color.value;
})




