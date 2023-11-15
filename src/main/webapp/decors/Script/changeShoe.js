function changeShoe() {
    let selectedShoes = document.getElementById("shoes").value;
    switch (selectedShoes) {
        case "jordan1":
            if(document.getElementById("airforce1").getAttribute("display") == "view"){
                document.getElementById("airforce1").setAttribute("display", "none");
                document.getElementById("AF1Menu").style.display = "none";
            }
            
            if(document.getElementById("converse").getAttribute("display") == "view"){
                document.getElementById("converse").setAttribute("display", "none");
                document.getElementById("converseMenu").style.display = "none";
            }
            
            if(document.getElementById("vans").getAttribute("display") == "view"){
                document.getElementById("vans").setAttribute("display", "none");
                document.getElementById("vansMenu").style.display = "none";
            }
            
            if(document.getElementById("blazermid").getAttribute("display") == "view"){
                document.getElementById("blazermid").setAttribute("display", "none");
                document.getElementById("blazerMidMenu").style.display = "none";
            }
            document.getElementById("jordan1").setAttribute("display", "view");
            document.getElementById("jordan1Menu").style.display = "block";
            document.getElementById("shoesPrice").innerHTML = "1,700,000";
            break;
        case "airforce1":
            if(document.getElementById("jordan1").getAttribute("display") == "view"){
                document.getElementById("jordan1").setAttribute("display", "none");
                document.getElementById("jordan1Menu").style.display = "none";
            }
            if(document.getElementById("converse").getAttribute("display") == "view"){
                document.getElementById("converse").setAttribute("display", "none");
                document.getElementById("converseMenu").style.display = "none";
            }
            if(document.getElementById("vans").getAttribute("display") == "view"){
                document.getElementById("vans").setAttribute("display", "none");
                document.getElementById("vansMenu").style.display = "none";
            }
            if(document.getElementById("blazermid").getAttribute("display") == "view"){
                document.getElementById("blazermid").setAttribute("display", "none");
                document.getElementById("blazerMidMenu").style.display = "none";
            }
            
            document.getElementById("airforce1").setAttribute("display", "view");
            document.getElementById("AF1Menu").style.display = "block";
            document.getElementById("shoesPrice").innerHTML = "2,100,000";
            break;
        case "converse":
            if(document.getElementById("airforce1").getAttribute("display") == "view"){
                document.getElementById("airforce1").setAttribute("display", "none");
                document.getElementById("AF1Menu").style.display = "none";
            }
            
            if(document.getElementById("jordan1").getAttribute("display") == "view"){
                document.getElementById("jordan1").setAttribute("display", "none");
                document.getElementById("jordan1Menu").style.display = "none";
            }
            
            if(document.getElementById("vans").getAttribute("display") == "view"){
                document.getElementById("vans").setAttribute("display", "none");
                document.getElementById("vansMenu").style.display = "none";
            }
            
            if(document.getElementById("blazermid").getAttribute("display") == "view"){
                document.getElementById("blazermid").setAttribute("display", "none");
                document.getElementById("blazerMidMenu").style.display = "none";
            }
            
            document.getElementById("converse").setAttribute("display", "view");
            document.getElementById("converseMenu").style.display = "block";
            document.getElementById("shoesPrice").innerHTML = "1,050,000";
            break;
        case "vans":
            if(document.getElementById("airforce1").getAttribute("display") == "view"){
                document.getElementById("airforce1").setAttribute("display", "none");
                document.getElementById("AF1Menu").style.display = "none";
            }
            
            if(document.getElementById("converse").getAttribute("display") == "view"){
                document.getElementById("converse").setAttribute("display", "none");
                document.getElementById("converseMenu").style.display = "none";
            }
            
            if(document.getElementById("jordan1").getAttribute("display") == "view"){
                document.getElementById("jordan1").setAttribute("display", "none");
                document.getElementById("jordan1Menu").style.display = "none";
            }
            
            if(document.getElementById("blazermid").getAttribute("display") == "view"){
                document.getElementById("blazermid").setAttribute("display", "none");
                document.getElementById("blazerMidMenu").style.display = "none";
            }
            
            
            
            document.getElementById("vans").setAttribute("display", "view");
            document.getElementById("vansMenu").style.display = "block";
            document.getElementById("shoesPrice").innerHTML = "1,200,000";
            break;
            
        case "blazermid":
            if(document.getElementById("airforce1").getAttribute("display") == "view"){
                document.getElementById("airforce1").setAttribute("display", "none");
                document.getElementById("AF1Menu").style.display = "none";
            }
            
            if(document.getElementById("converse").getAttribute("display") == "view"){
                document.getElementById("converse").setAttribute("display", "none");
                document.getElementById("converseMenu").style.display = "none";
            }
            
            if(document.getElementById("vans").getAttribute("display") == "view"){
                document.getElementById("vans").setAttribute("display", "none");
                document.getElementById("vansMenu").style.display = "none";
            }
            
            if(document.getElementById("jordan1").getAttribute("display") == "view"){
                document.getElementById("jordan1").setAttribute("display", "none");
                document.getElementById("jordan1Menu").style.display = "none";
            }
            
            document.getElementById("blazermid").setAttribute("display", "view");
            document.getElementById("blazerMidMenu").style.display = "block";
            document.getElementById("shoesPrice").innerHTML = "2,350,000";
            break;
        default:
            break;
    }
}
