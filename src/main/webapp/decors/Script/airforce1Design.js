let midSoleAF1 = document.querySelector(".midSoleAF1"),
    backAF1 = document.querySelectorAll(".backAF1"),
    textAF1 = document.querySelectorAll(".textAF1"),
    sockLiningAF1 = document.querySelector(".sockLiningAF1"),
    eyestayAF1 = document.querySelectorAll(".eyestayAF1"),
    heelAF1 = document.querySelector(".heelAF1"),
    toeBoxAF1 = document.querySelector(".toeBoxAF1"),
    tipAF1 = document.querySelector(".tipAF1"),
    quarterAF1 = document.querySelector(".quarterAF1"),
    swooshAF1 = document.querySelector(".swooshAF1"),
    laceAF1 = document.querySelectorAll(".laceAF1"),
    tongueAF1 = document.querySelectorAll(".tongueAF1"),
    tongueAF1Rim = document.querySelector(".tongueRimAF1"),
    tongueAF1Tag = document.querySelector(".tongueTagAF1"),
    outSoleAF1 = document.querySelectorAll(".outSoleAF1")

let midSoleAF1Color = document.getElementById("midSoleAF1Color"),
    textAF1Color = document.getElementById("textAF1Color"),
    backAF1Color = document.getElementById("backAF1Color"),
    sockLiningAF1Color = document.getElementById("sockLiningAF1Color"),
    eyestayAF1Color = document.getElementById("eyestayAF1Color"),
    heelAF1Color = document.getElementById("heelAF1Color"),
    toeBoxAF1Color = document.getElementById("toeBoxAF1Color"),
    tipAF1Color = document.getElementById("tipAF1Color"),
    quarterAF1Color = document.getElementById("quarterAF1Color"),
    swooshAF1Color = document.getElementById("swooshAF1Color"),
    laceAF1Color = document.getElementById("laceAF1Color"),
    tongueAF1Color = document.getElementById("tongueAF1Color"),
    tongueAF1RimColor = document.getElementById("tongueRimAF1Color"),
    tongueAF1TagColor = document.getElementById("tongueTagAF1Color"),
    outsoleAF1Color = document.getElementById("outSoleAF1Color");

midSoleAF1Color.addEventListener("input", () => {
    midSoleAF1.style.fill = midSoleAF1Color.value;
    document.getElementById("midSoleAF1ColorWrapper").style.backgroundColor = midSoleAF1Color.value;
})

sockLiningAF1Color.addEventListener("input", () => {
    sockLiningAF1.style.fill = sockLiningAF1Color.value;
    document.getElementById("sockLiningAF1ColorWrapper").style.backgroundColor = sockLiningAF1Color.value;
})

textAF1.forEach(item => textAF1Color.addEventListener("input", () => {
    item.style.fill = textAF1Color.value;
    document.getElementById("textAF1ColorWrapper").style.backgroundColor = textAF1Color.value;
}))


backAF1.forEach(item => backAF1Color.addEventListener("input", () => {
    item.style.fill = backAF1Color.value;
    document.getElementById("backAF1ColorWrapper").style.backgroundColor = backAF1Color.value;
}))

eyestayAF1.forEach(item => eyestayAF1Color.addEventListener("input", () => {
    item.style.fill = eyestayAF1Color.value;
    document.getElementById("eyestayAF1ColorWrapper").style.backgroundColor = eyestayAF1Color.value;
}))

heelAF1Color.addEventListener("input", () => {
    heelAF1.style.fill = heelAF1Color.value;
    document.getElementById("heelAF1ColorWrapper").style.backgroundColor = heelAF1Color.value;
})

toeBoxAF1Color.addEventListener("input", () => {
    toeBoxAF1.style.fill = toeBoxAF1Color.value;
    document.getElementById("toeBoxAF1ColorWrapper").style.backgroundColor = toeBoxAF1Color.value;
})

tipAF1Color.addEventListener("input", () => {
    tipAF1.style.fill = tipAF1Color.value;
    document.getElementById("tipAF1ColorWrapper").style.backgroundColor = tipAF1Color.value;
})

quarterAF1Color.addEventListener("input", () => {
    quarterAF1.style.fill = quarterAF1Color.value;
    document.getElementById("quarterAF1ColorWrapper").style.backgroundColor = quarterAF1Color.value;
})

swooshAF1Color.addEventListener("input", () => {
    swooshAF1.style.fill = swooshAF1Color.value;
    document.getElementById("swooshAF1ColorWrapper").style.backgroundColor = swooshAF1Color.value;
})

laceAF1.forEach(item => laceAF1Color.addEventListener("input", () => {
    item.style.fill = laceAF1Color.value;
    document.getElementById("laceAF1ColorWrapper").style.backgroundColor = laceAF1Color.value;
}))

tongueAF1.forEach(item => tongueAF1Color.addEventListener("input", () => {
    item.style.fill = tongueAF1Color.value;
    document.getElementById("tongueAF1ColorWrapper").style.backgroundColor = tongueAF1Color.value;
}))

tongueAF1RimColor.addEventListener("input", () => {
    tongueAF1Rim.style.fill = tongueAF1RimColor.value;
    document.getElementById("tongueRimAF1ColorWrapper").style.backgroundColor = tongueAF1RimColor.value;
})

tongueAF1TagColor.addEventListener("input", () => {
    tongueAF1Tag.style.fill = tongueAF1TagColor.value;
    document.getElementById("tongueTagAF1ColorWrapper").style.backgroundColor = tongueAF1TagColor.value;
})

outSoleAF1.forEach(item => outsoleAF1Color.addEventListener("input", () => {
    item.style.fill = outsoleAF1Color.value;
    document.getElementById("outSoleAF1ColorWrapper").style.backgroundColor = outsoleAF1Color.value;
}))

