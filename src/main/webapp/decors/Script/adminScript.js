
let productManagement = document.getElementById("productManagement"),
    userManagement = document.getElementById("userManagement"),
    orderManagement = document.getElementById("orderManagement"),
    user = document.getElementById("user"),
    product = document.getElementById("product"),
    order = document.getElementById("order"),
    analyticsView = document.getElementById("analyticsView"),
    analytics = document.getElementById("analytics");

function showUserManagement(){
    
    if(order.style.display === "block"){
        order.style.display = "none";
        orderManagement.style.background = "transparent";
        orderManagement.style.color = "black";
    }
    if(analytics.style.display === "flex"){
        analytics.style.display = "none";
        analyticsView.style.background = "transparent";
        analyticsView.style.color = "black";
    }
    user.style.display = "block";
    userManagement.style.background = "rgba(103, 215, 249, 0.5)";
};

userManagement.onmouseover = function() {
    userManagement.style.color = 'rgb(86, 137, 213)'; 
};
userManagement.onmouseout = function() {
    userManagement.style.color = 'black'; 
};

function showOrderManagement() {
    if(user.style.display === "block"){
        user.style.display = "none";
        userManagement.style.background = "transparent";
        userManagement.style.color = "black";
    }
    
    if(analytics.style.display === "flex"){
        analytics.style.display = "none";
        analyticsView.style.background = "transparent";
        analyticsView.style.color = "black";
    }
    order.style.display = "block";
    orderManagement.style.background = "rgba(103, 215, 249, 0.5)";
};

orderManagement.onmouseover = function() {
    orderManagement.style.color = 'rgb(86, 137, 213)'; 
};
orderManagement.onmouseout = function() {
    orderManagement.style.color = 'black'; 
};

function showAnalytics(){
    
    if(order.style.display === "block"){
        order.style.display = "none";
        orderManagement.style.background = "transparent";
        orderManagement.style.color = "black";
    }
    if(user.style.display === "block"){
        user.style.display = "none";
        userManagement.style.background = "transparent";
        userManagement.style.color = "black";
    }
    analytics.style.display = "flex";
    analyticsView.style.background = "rgba(103, 215, 249, 0.5)";
};

analyticsView.onmouseover = function() {
    analyticsView.style.color = 'rgb(86, 137, 213)'; 
};
analyticsView.onmouseout = function() {
    analyticsView.style.color = 'black'; 
};

let orderSearch = document.getElementById('searchOrder');
orderSearch.addEventListener("keyup", filterTableOrder);

function filterTableOrder() {
    // Get input value and convert to uppercase for case-insensitive search
    let filterValue = orderSearch.value.toUpperCase();

    // Get table element
    let table = document.getElementById('tableOrder');

    // Get tbody element
    let tbody = table.getElementsByTagName('tbody')[0];

    // Get all tr elements from the tbody
    let tr = tbody.getElementsByTagName('tr');

    // Loop through all table rows
    for(let i = 0; i < tr.length; i++) {
        // Get all th elements from each row
        let td = tr[i].getElementsByTagName('td');

        // Check if the row has at least two th elements
        if(td.length > 1) {
            // Get the innerHTML of the second th element
            let secondThValue = td[1].innerHTML.toUpperCase();

            // If the second th element contains the search term, show the row, else hide it
            if(secondThValue.indexOf(filterValue) > -1) {
                tr[i].style.display = '';
            } else {
                tr[i].style.display = 'none';
            }
        }
    }
};

let userSearch = document.getElementById('searchUser');
userSearch.addEventListener("keyup", filterTableUser);

function filterTableUser() {
    // Get input value and convert to uppercase for case-insensitive search
    let filterValue = userSearch.value.toUpperCase();

    // Get table element
    let table = document.getElementById('tableUser');

    // Get tbody element
    let tbody = table.getElementsByTagName('tbody')[0];

    // Get all tr elements from the tbody
    let tr = tbody.getElementsByTagName('tr');

    // Loop through all table rows
    for(let i = 0; i < tr.length; i++) {
        // Get all th elements from each row
        let td = tr[i].getElementsByTagName('td');

        // Check if the row has at least two th elements
        if(td.length > 1) {
            // Get the innerHTML of the second th element
            let secondThValue = td[1].innerHTML.toUpperCase();

            // If the second th element contains the search term, show the row, else hide it
            if(secondThValue.indexOf(filterValue) > -1) {
                tr[i].style.display = '';
            } else {
                tr[i].style.display = 'none';
            }
        }
    }
};
