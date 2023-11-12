let midSoleConverse = document.querySelectorAll(".midSoleConverse"),
    logoConverse = document.querySelector(".logoConverse"),
    starTextConverse = document.querySelector(".starTextConverse"),
    heelPatchConverse = document.querySelector(".heelPatchConverse"),
    bodyConverse = document.querySelector(".bodyConverse"),
    midSoleLineConverse = document.querySelectorAll(".midSoleLineConverse"),
    toeCapConverse = document.querySelector(".toeCapConverse"),
    eyeHolesConverse = document.querySelectorAll(".eyeHolesConverse"),
    tongueConverse = document.querySelectorAll(".tongueConverse"),
    laceConverse = document.querySelectorAll(".laceConverse");

let bodyConverseColor = document.getElementById("bodyConverseColor"),
    logoConverseColor = document.getElementById("logoConverseColor"),
    starTextConverseColor = document.getElementById("starTextConverseColor"),
    heelPatchConverseColor = document.getElementById("heelPatchConverseColor"),
    midSoleConverseColor = document.getElementById("midSoleConverseColor"),
    midSoleLineConverseColor = document.getElementById("midSoleLineConverseColor"),
    toeCapConverseColor = document.getElementById("toeCapConverseColor"),
    eyeHolesConverseColor = document.getElementById("eyeHolesConverseColor"),
    tongueConverseColor = document.getElementById("tongueConverseColor"),
    laceConverseColor = document.getElementById("laceConverseColor");

bodyConverseColor.addEventListener("input", () => {
    bodyConverse.style.fill = bodyConverseColor.value;
    document.getElementById("bodyConverseColorWrapper").style.backgroundColor = bodyConverseColor.value;
});

logoConverseColor.addEventListener("input", () => {
    logoConverse.style.fill = logoConverseColor.value;
    document.getElementById("logoConverseColorWrapper").style.backgroundColor = logoConverseColor.value;
});

starTextConverseColor.addEventListener("input", () => {
    starTextConverse.style.fill = starTextConverseColor.value;
    document.getElementById("starTextConverseColorWrapper").style.backgroundColor = starTextConverseColor.value;
});

heelPatchConverseColor.addEventListener("input", () => {
    heelPatchConverse.style.fill = heelPatchConverseColor.value;
    document.getElementById("heelPatchConverseColorWrapper").style.backgroundColor = heelPatchConverseColor.value;
})

midSoleConverse.forEach(item => midSoleConverseColor.addEventListener("input", () => {
    item.style.fill = midSoleConverseColor.value;
    document.getElementById("midSoleConverseColorWrapper").style.backgroundColor = midSoleConverseColor.value;
}))


midSoleLineConverse.forEach(item => midSoleLineConverseColor.addEventListener("input", () => {
    item.style.fill = midSoleLineConverseColor.value;
    document.getElementById("midSoleLineConverseColorWrapper").style.backgroundColor = midSoleLineConverseColor.value;
}))

toeCapConverseColor.addEventListener("input", () => {
    toeCapConverse.style.fill = toeCapConverseColor.value;
    document.getElementById("toeCapConverseColorWrapper").style.backgroundColor = toeCapConverseColor.value;
})

eyeHolesConverse.forEach(item => eyeHolesConverseColor.addEventListener("input", () => {
    item.style.fill = eyeHolesConverseColor.value;
    document.getElementById("eyeHolesConverseColorWrapper").style.backgroundColor = eyeHolesConverseColor.value;
}))

tongueConverse.forEach(item => tongueConverseColor.addEventListener("input", () => {
    item.style.fill = tongueConverseColor.value;
    document.getElementById("tongueConverseColorWrapper").style.backgroundColor = tongueConverseColor.value;
}))

laceConverse.forEach(item => laceConverseColor.addEventListener("input", () => {
    item.style.fill = laceConverseColor.value;
    document.getElementById("laceConverseColorWrapper").style.backgroundColor = laceConverseColor.value;
}))


