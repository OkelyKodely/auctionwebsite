<%
option explicit
%>
<html>
  <head>
	<link href="/include/bootstrap.min.css" rel="stylesheet" />
    <style>
      .main {
        text-align: left;
        width: 700px;
      }
      .text {
        font-family: arial;
        color: #bbb;
        text-decoration: none;
        font-size:12px;
      }
      .item {
        width: 700px;
        height: 200px;
      }
      .a {
        text-decoration:none;
      }
    </style>
  </head>
  <body style="background-color:pink">
    <table align="center" bgcolor="#5522aa">
      <tr>
        <td bgcolor="BLACK">
          <div style="width:700px;float:left;position:relative;top:16px">
            <a href="index.asp"><img src="/graphics/logo.png"></a><br>
            <a href="/category.asp?category=shorts"><img src="/graphics/shorts.png">
            <a href="/category.asp?category=pants"><img onclick="window.location.href='/category.asp?category=pants'" src="/graphics/pants.png"></a>
            <a href="/category.asp?category=dresses"><img onclick="window.location.href='/category.asp?category=dresses'" src="/graphics/dresses.png"></a>
            <a href="/category.asp?category=shoes"><img onclick="window.location.href='/category.asp?category=shoes'" src="/graphics/shoes.png"></a>
            <a href="/category.asp?category=tops"><img onclick="window.location.href='/category.asp?category=tops'" src="/graphics/tops.png"></a>
            <a href="/category.asp?category=jeans"><img onclick="window.location.href='/category.asp?category=jeans'" src="/graphics/jeans.png"></a>
            <a href="/category.asp?category=others"><img onclick="window.location.href='/category.asp?category=others'" src="/graphics/others.png"></a>
          <div style="color:white;width:700px;">
          <div syle="position:relative;top:20px">
            &nbsp; Follow us: 
            <a style="color:white;" href="https://facebook.com/auctiononrails">Fb</a>
            <a style="color:white;" href="https://youtube.com/auctiononrails">Yt</a>
            <a style="color:white;" href="https://instagram.com/auctiononrails">Ig</a>
            <a style="color:white;" href="https://twitter.com/auctiononrails">Tt</a>
          </div>
          </div>
          </div>
          <br>
    <center>
    <div style="width:800px">
      <div style="color:white;float:left;width:1500px">
        <%
        if Session("userid") = "" then
        %>
      <a href="/login.asp" style="color:yellow">Login</a>
      <%
      else
        Response.write "Hi " & Session("userid") & " <a style='color:gray' href='logout.asp'>Logout</a>"
        %>
        <%
        if Session("userid") <> "" then
        %>
  <div>
    <div>
      <a href="/itemswon.asp" style="color:gray">*Items you won</a>
    </div>
  </div>
        <%
        end if
      end if
      %>
    </div>
  </div>
</td>
</tr>
<tr>
<td>
  <table>
    <tr>
      <td valign="top" width="200" bgcolor="maroon" style="border:0px solid navy">
        <!--#include file="include/leftsidebar.inc"-->
        <br>
        <br>
      </td>
      <td bgcolor="maroon" valign="top" width="864">
    <div class="main">
      <div class="item">
      	<div style="float:left">
      		<table width="100%" cellspacing="10" cellpadding="10">
      			<tr>
      				<td valign="top">
			      		<img src="list-item-strip.png">
			      		&nbsp;
      				</td>
      				<td valign="top">
                <h1 style="color:black">List My Item</h1>
  <form method="post" action="my-item-upload.asp" enctype="multipart/form-data">
    <table style="color:white">
      <tr>
  <td><div style="padding:10px">Item ID: </div></td><td><input type="text" name="itemid" style="color:black"></td>
</tr>
<tr>
  <td><div style="padding:10px">Fashion Category: </div></td>
  <td>
    <select name="category" style="color:black">
      <option value="tops">Tops</option>
      <option value="shoes">Shoes</option>
      <option value="dresses">Dresses</option>
      <option value="shorts">Shorts</option>
      <option value="pants">Pants</option>
      <option value="jeans">Jeans</option>
      <option value="others">Others</option>
    </select>
  </td>
</tr>
<tr>
  <td><div style="padding:10px">Name: </div></td><td><input type="text" name="itemname" style="color:black"></td>
</tr>
<tr>
  <td><div style="padding:10px">Seller Price: </div></td><td>$<input type="text" name="price" style="color:black"></td>
</tr>
<tr>
  <td><div style="padding:10px">Shipping Price: </div></td><td>$<input type="text" name="shippingsale" style="color:black"></td>
</tr>
<tr>
  <td><div style="padding:10px">Description: </div></td><td><textarea name="description" style="width:300px;height:100px;color:black"></textarea></td>
</tr>
<tr>
  <td><div style="padding:10px">Image: </div></td><td><input type="file" name="file"></td>
</tr>
<tr>
  <td><div style="padding:10px">Auction Ends: </div></td><td><input name="auctionends" type="text" style="color:black"></td>
</tr>
    <tr>
    <td><div style="padding:10px"><input style="color:purple" type="submit" name="submit" value="list the item"></div></td>
  </tr>
</table>
</form>
      </div>
    </div>
  </td>
</tr>
</table>
  </td>
</tr>
</table>
  <!--#include file="include/footer.asp"-->
</center>
  </body>
</html>