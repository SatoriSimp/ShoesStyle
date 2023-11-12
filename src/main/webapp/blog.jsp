<%@page import="servlet.registration.objects.Cart"%>
<%@page import="servlet.registration.objects.Account"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/8a92f73d4a.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
        href="https://fonts.googleapis.com/css2?family=Inter:wght@500;600;700;800&display=swap"
        rel="stylesheet"
    />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <!-- cdn -->
    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
    />
    <link rel="stylesheet" href="decors/home.css" />
    <title>Blog</title>
    <link rel="stylesheet" href="decors/blog.css">
</head>

<body>
    <%     
        Account acc = (Account) session.getAttribute("UserAccount");
        Cart cart = acc == null ? null : acc.getUserCart();
    %>
    <nav class="navbar">
        <!-- Logo -->
        <img onclick="window.open('home.jsp'); cursor: pointer;" src="./img/Logo.svg" alt="HAPS|SNEAKERS." />

        <!-- Navigation -->
        <ul>
            <li><a href="design.jsp">Design</a></li>
            <li><a href="gallery.jsp">Gallery</a></li>
            <li><a class="selected" href="#">Blog</a></li>
            <li><a href="guide.jsp">Guidelines</a></li>
            <li><a href="contact.jsp">About us</a></li>
        </ul>

        <!-- Action -->
        <div class="action">
            <% if (acc == null) { %>
            <a href="login.jsp" class="btn action-btn">
                <i class="fas fa-user-alt fa-2xs" style="color: #ffffff;"></i>
                <label style="font-size: 20px;">Account</label>
            </a>
            <% } else { %>
            <a href="account.jsp" class="btn action-btn">
                <i class="fas fa-user-alt fa-2xs" style="color: #ffffff;"></i>
                <label style="font-size: 16px; margin-bottom: 20px;"><%= acc.getStrUsername() %></label>
            </a>
            <% } %>
        </div>
        
        <button class="cart" onclick="window.open('cart.jsp', '_self')">
            <i class="fa fa-shopping-cart"></i>
            <div style="position: relative; font-size: 18px; 
                 font-weight: bolder;
                 color: white; background: #0066ff; 
                 border-radius: 5px; padding: 5%;
                 margin-top: 10%; margin-left: 5%">
                <% if (cart == null) { %> 
                0
                <% } else { %>
                <%= cart.getQuantity() %>
                <% } %>
            </div>
        </button>
    </nav>

    <h1>Articles</h1>
    <div class="posts">
        <div class="card">
            <div class="postimg">
                
                <a href="https://laforce.vn/cach-custom-giay-3333/">
                    <img src="img/customSneakers.jpg" alt="Customizing Sneakers" id="postimage">
                </a>
            </div>
            <div class="content">
                <a href="https://laforce.vn/cach-custom-giay-3333/" class="titleLink">
                    <h4 class="title">Những điều bạn cần biết về Custom giày</h4>
                </a>
                <h5 class="date">June 25, 2023</h5>
                <p class="description">Custom giày nổi lên như một trào lưu ở giới trẻ và những người đam mê giày
                    trong
                    những năm gần đây. Vậy thì điều đó có gì thú vị ? Cùng tìm hiểu thôi.</p>
            </div>
            
            <button></button>
        </div>

        <div class="card">
            <div class="postimg">
                
                <a href="https://thietkegiay.com/thiet-ke-giay-la-gi-co-bao-nhieu-mau-giay-moi-2021/">
                    <img src="img/multipleShoes.jpg" alt="Shoes Designs" id="postimage">
                </a>
            </div>
            <div class="content">
                <a href="https://thietkegiay.com/thiet-ke-giay-la-gi-co-bao-nhieu-mau-giay-moi-2021/" class="titleLink">
                    <h4 class="title">Thiết kế giày là gì ?</h4>
                </a>
                <h5 class="date">May 5, 2021</h5>
                <p class="description">Bạn thường nghe người ta nói thiết kế giày dép, thiết kế giày cao gót, thiết kế giày thể thao, thiết kế giày nike hoặc thiết kế giày theo yêu cầu. Tuy nhiên bạn vẫn chưa rõ thiết kế giày là làm gì thì hãy cùng HAPS Sneakers giải đáp thông qua bài viết này nhé!</p>
            </div>

            <button></button>
        </div>
        
        <div class="card">
            <div class="postimg">
                
                <a href="https://vilas.edu.vn/chi-phi-thuc-su-cua-mot-doi-giay-nike-hoac-adidas-la-bao-nhieu-phan-1.html">
                    <img src="img/sneakerPrice.jpg" alt="Sneakers Price" id="postimage">
                </a>
            </div>
            <div class="content">
                <a href="https://vilas.edu.vn/chi-phi-thuc-su-cua-mot-doi-giay-nike-hoac-adidas-la-bao-nhieu-phan-1.html" class="titleLink">
                    <h4 class="title">Chi phí thật sự của 1 đôi giày Sneakers</h4>
                </a>
                <h5 class="date">Oct 2, 2020</h5>
                <p class="description">Chắc hẳn không ít lần bạn đã lướt qua những bình luận trên Internet về giá những đôi giày và tại sao chúng lại mắc tới thế? Cùng HAPS Sneakers tìm hiểu thông qua bài viết này nhé! </p>
            </div>
            
            <button></button>
        </div>
        
        <div class="card">
            <div class="postimg">
                
                <a href="https://giffan.vn/blogs/xu-huong/top-3-dieu-ban-can-biet-khi-custom-giay-sneaker">
                    <img src="img/3_dieu_can_biet_khi_custom_sneakers.jpg" alt="Customizing Sneakers" id="postimage">
                </a>
            </div>
            <div class="content">
                <a href="https://giffan.vn/blogs/xu-huong/top-3-dieu-ban-can-biet-khi-custom-giay-sneaker" class="titleLink">
                    <h4 class="title">Top 3 điều bạn cần biết khi custom giày sneakers</h4>
                </a>
                <h5 class="date">Feb 2, 2017</h5>
                <p class="description">GenZ là một thế hệ đặc biệt, họ luôn tìm tòi sự mới lạ và phá cách. Điều đó dẫn tới trào lưu Custom Sneakers hiện đang rất nổi trong thời gian gần đây. Hãy cùng nhau tìm hiều 3 điều cần biết khi custom giày thông qua bài viết này nhé! </p>
            </div>
            
            <button></button>
        </div>
        
        <div class="card">
            <div class="postimg">
                
                <a href="https://prowin.com.vn/blogs/news/tim-hieu-ve-xu-huong-giay-the-thao-thoi-trang-thiet-ke-va-mau-sac" >
                    <img src="img/typeofShoes.jpg" alt="typeofShoes" id="postimage">
                </a>
            </div>
            <div class="content">
                <a href="https://prowin.com.vn/blogs/news/tim-hieu-ve-xu-huong-giay-the-thao-thoi-trang-thiet-ke-va-mau-sac" class="titleLink">
                    <h4 class="title">Thiết kế và màu sắc của giày</h4>
                </a>
                <h5 class="date">Apr 8, 2023</h5>
                <p class="description">Trong thế giới giày dép thì có hàng vạn mẫu mã cũng như màu sắc. Do nó cũng là một loại thời trang nên xu hướng thay đổi theo từng thời kì là một việc không thể tránh khỏi. Hãy cùng HAPS Sneakers tìm hiểu thông qua bài viết này nhé</p>
            </div>
             <button></button>
        </div>
        
        <div class="card">
            <div class="postimg">
                
                <a href="https://sneakerdaily.vn/tat-tan-tat-ve-lich-su-phat-hanh-cua-air-jordan/">
                    <img src="img/Jordan1.jpg" alt="Jordan1" id="postimage">
                </a>
            </div>
            <div class="content">
                <a href="https://sneakerdaily.vn/tat-tan-tat-ve-lich-su-phat-hanh-cua-air-jordan/" class="titleLink">
                    <h4 class="title">Lịch sử về Air Jordan</h4>
                </a>
                <h5 class="date">June 8, 2021</h5>
                <p class="description">Air Jordan là dòng giày được giới SneakerHead cho là đôi giày làm nên lịch sử. Để tìm hiểu kĩ hơn về dòng giày mang trong mình tinh thần của huyền thoại bóng rổ Michael Jordan thì hãy cùng HAPS Sneakers ghé qua bài viết này nhé !</p>
            </div>
            <button></button>
        </div>

        <button id="surprise" onclick="location.href='https://www.youtube.com/watch?v=dQw4w9WgXcQ&pp=ygUJcmljayByb2xs'">
            Click for surprise !
        </button>

    </div>


    <footer>
        <div>
        <p>Contact us via</p>
        <button>
            <i class="fa fa-facebook"></i> 
            Facebook
        </button>
        <button>
            <i class="fa fa-youtube-play"></i> 
            Youtube
        </button>
        <button>
            <i class="fa fa-envelope"></i>
            Email
        </button>
        </div>
    </footer>
</body>

</html>