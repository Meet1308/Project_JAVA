<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "CustomerHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>

</head>
<body>
		<section id="cart_items">
		<div class="container">
			<h1 style="margin-bottom: 30px;font-size: 40px;">Welcome to Cart</h1>
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">Image</td>
							<td class="description">Product Name</td>
							<td class="price">Product Price</td>
							<td class="quantity">Product Quantity</td>
							<td class="total">Subtotal</td>
							<td>Remove Product</td>
							<td></td>
						</tr>
					</thead>
					<%int net_price = 0; %>
					<% List<Cart> list = CartDao.getCartByCusid(c.getId()); %>
					<tbody>
					<% for(Cart cr:list){ %>
					<% net_price = net_price + cr.getTotal_amount(); %>
						<tr>
							<td class="cart_product">
								<a href=""><img src="image/<%=cr.getImage() %>" alt="" height="100px" width="80px"></a>
							</td>
							<td class="cart_description">
								<h4><a href=""><%=cr.getPname() %></a></h4>
								
							</td>
							<td class="cart_price">
								<p>Rs. <%=cr.getPprice() %></p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									<form action="CartController" method="post" name="form">
										<input type="hidden" name="cartid" value="<%=cr.getCart_id()%>">
										<input type="hidden" name="pprice" value="<%=cr.getPprice()%>">
										<input type="number" name="qty" value="<%=cr.getQty()%>" onchange="this.form.submit()">
									</form>
								</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price"><%=cr.getTotal_amount() %></p>
							</td>
							<td class="cart_delete">
								<a class="cart_quantity_delete " href="removefromcart.jsp?cart_id=<%=cr.getCart_id()%>"><i class="fa fa-times btn btn-danger"></i></a>
							</td>
						</tr>
						<% } %>
						
					</tbody>
				</table>
				<a href="Customer-home.jsp" class="btn btn-primary" style="margin-left: 500px;">Continue Shopping </a>
			</div>
			
		</div>
	</section> <!--/#cart_items-->

	<section id="do_action">
		<div class="container">
				<div class="col-sm-15">
				<form method="post" action="payment.jsp?amount=<%=net_price%>&cus_id=<%=c.getId() %>" style="padding-left: 35%;"> 
				<table border="1" cellpadding="20px">
					<tbody>
						<tr>
							<th>S.No</th>
							<th>Label</th>
							<th>Value</th>
						</tr>
						
						<tr>
							<td>1</td>
							<td><label>txnAmount*</label></td>
							<td><input title="TXN_AMOUNT" tabindex="10"
								type="text" name="TXN_AMOUNT"
								value="<%=net_price%>">
							</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td><input value="CheckOut" type="submit"	onclick=""></td>
						</tr>
					</tbody>
				</table>
		* - Mandatory Fields
	</form>
				</div>
			</div>
		</div>
	</section><!--/#do_action-->

	<footer id="footer"><!--Footer-->
		<div class="footer-top">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<div class="companyinfo">
							<h2><span>e</span>-shopper</h2>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,sed do eiusmod tempor</p>
						</div>
					</div>
					<div class="col-sm-7">
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="images/home/iframe1.png" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>Circle of Hands</p>
								<h2>24 DEC 2014</h2>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="images/home/iframe2.png" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>Circle of Hands</p>
								<h2>24 DEC 2014</h2>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="images/home/iframe3.png" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>Circle of Hands</p>
								<h2>24 DEC 2014</h2>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="images/home/iframe4.png" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>Circle of Hands</p>
								<h2>24 DEC 2014</h2>
							</div>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="address">
							<img src="images/home/map.png" alt="" />
							<p>505 S Atlantic Ave Virginia Beach, VA(Virginia)</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="footer-widget">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Service</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">Online Help</a></li>
								<li><a href="">Contact Us</a></li>
								<li><a href="">Order Status</a></li>
								<li><a href="">Change Location</a></li>
								<li><a href="">FAQ’s</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Quock Shop</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">T-Shirt</a></li>
								<li><a href="">Mens</a></li>
								<li><a href="">Womens</a></li>
								<li><a href="">Gift Cards</a></li>
								<li><a href="">Shoes</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Policies</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">Terms of Use</a></li>
								<li><a href="">Privecy Policy</a></li>
								<li><a href="">Refund Policy</a></li>
								<li><a href="">Billing System</a></li>
								<li><a href="">Ticket System</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>About Shopper</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">Company Information</a></li>
								<li><a href="">Careers</a></li>
								<li><a href="">Store Location</a></li>
								<li><a href="">Affillate Program</a></li>
								<li><a href="">Copyright</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3 col-sm-offset-1">
						<div class="single-widget">
							<h2>About Shopper</h2>
							<form action="#" class="searchform">
								<input type="text" placeholder="Your email address" />
								<button type="submit" class="btn btn-default"><i class="fa fa-arrow-circle-o-right"></i></button>
								<p>Get the most recent updates from <br />our site and be updated your self...</p>
							</form>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p class="pull-left">Copyright © 2013 E-SHOPPER Inc. All rights reserved.</p>
					<p class="pull-right">Designed by <span><a target="_blank" href="http://www.themeum.com">Themeum</a></span></p>
				</div>
			</div>
		</div>
		
	</footer><!--/Footer-->
	
	<!-- JavaScript code -->
    

    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>