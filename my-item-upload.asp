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
  <%
  Set Conn = Server.CreateObject("ADODB.Connection")
  Conn.open "PROVIDER=SQLOLEDB;DATABASE=AuctionOnRails;DATA SOURCE=(local);User ID=sa;Password=coppersink21"
  %>
</td>
</tr>
<tr>
<td>
  <table>
    <tr>
      <td valign="top" bgcolor="maroon">
        &nbsp;
      </td>
      <td valign="top" width="200" bgcolor="maroon" style="border:0px solid navy">
        <!--#include file="include/leftsidebar.inc"-->
        <br>
        <br>
      </td>
      <td bgcolor="maroon">&nbsp;</td>
      <td valign="top" bgcolor="maroon" width="864">
        <h3 style="color:white">#1 Fashion Auction Site in the world</h3>
    <div class="main">
      <div class="item">
      	<div style="float:left">
      		<table width="100%" cellspacing="10" cellpadding="10">
      			<tr>
      				<td valign="top">
			      		<img src="list-item-strip.png">
			      		&nbsp;
      				</td>
<%
    dim file, form

    set form = Server.CreateObject("ABCUpload4.XForm")
    form.Overwrite = True


    dim sqlstr

dim Conn
Set Conn = Server.Createobject("ADODB.Connection")
Conn.open "PROVIDER=SQLOLEDB;DATABASE=AuctionOnRails;DATA SOURCE=(local);User ID=sa;Password=coppersink21"

dim category

dim shippingsale, itemid, itemname, price, description, image, rs, auctionends

    shippingsale = form("shippingsale")

    dim theField

    Set theField = form.Files("file")
    If theField.FileExists Then theField.Save "/imgs/" & theField.FileName

    category = form("category")

    auctionends = form("auctionends")

    itemid = form("itemid")

    itemname = form("itemname")

    price = form("price")

    description = form("description")

    dim sql

    sql = "insert into items (itemid, category, itemname, price, description, image, input_timestamp, sellerid, shippingsale) values ('"&itemid&"', '"&category&"', '"&itemname&"', "&price&", '"&description&"', '/imgs/"&theField.FileName&"', '"&auctionends&"', '"&Session("userid")&"', '"&shippingsale&"')"

    Conn.execute(sql)

	set rs = Conn.execute("select itemid, itemname, shippingsale, price, description, image from items where itemid = '"&itemid&"'")
	if not rs.eof then
          				%>
					<td valign="top">
				        <a class="text" href='view-item.asp?itemID=<%=rs("itemid")%>' onmouseover="getSimilarItems('<%=rs("itemid")%>', 'similarItems');">
				          <img src='<%=rs("image")%>' width="300" height="300">
				        </a>&nbsp;
          			</td>
          			<td valign="top">
          <%=rs("itemid")%><br><br>
          <b><%=rs("itemname")%></b><br><br>
          $<%=rs("price")%><br><br>
          Shipping: $<%=rs("shippingsale")%><br><br>
          <div style="width:300px"><%=rs("description")%></div>
          <br><br><a href="index.asp">Shop more</a>
<%
	end if
%>
          			</td>
          		</tr>
          	</table>
        </div>
      </div>
    </div>
  </td>
</tr>
</table>
  <!--#include file="include/footer.asp"-->
  </td>
</tr>
</table>
</center>
  </body>
</html>