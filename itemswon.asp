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
    <%
    Set cnn = Server.CreateObject("ADODB.Connection")
    cnn.open "PROVIDER=SQLOLEDB;DATABASE=AuctionOnRails;DATA SOURCE=(local);User ID=sa;Password=coppersink21"
    dim itemID
    itemid = request("itemid")
    Set rs = cnn.execute("select itemid, description, image, itemname, price, bidder from itemswon where bidder = '"&Session("userid")&"' order by itemid desc")
    %>
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
    </div>
  </div>
  <%
  Set cnn = Server.CreateObject("ADODB.Connection")
  cnn.open "PROVIDER=SQLOLEDB;DATABASE=AuctionOnRails;DATA SOURCE=(local);User ID=sa;Password=coppersink21"
  %>
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
      <td valign="top" bgcolor="maroon" width="864">
    <div class="main">
      <div class="item" style="height:4000px">
<%
    while not rs.eof
%>
        <div>
          <h1 style="color:white">Item You Won</h1>
          <table width="100%" cellspacing="10" cellpadding="10">
      			<tr>
      				<td valign="top">
			      		<img src="/graphics/win-item-strip.png">
			      		&nbsp;
      				</td>
      				<td valign="top">
        <a class="text" href='view-item.asp?itemID=<%=rs("itemid")%>'>
          <img src='<%=rs("image")%>' width="300" height="300">
        </a>&nbsp;
          			</td>
          			<td valign="top" style="color:white" width="300">
          itemid <%=rs("itemid")%><br><br>
          <b><%=rs("itemname")%></b><br><br>
          $<%=rs("price")%><br><br>
          <font color="green">Item won by you!, </font> <%=rs("bidder")%><br><br>
          <%=rs("description")%><br><br>
          <a href='checkout.asp?itemid=<%=rs("itemid")%>'>buy now</a>
          <br><br><a href="index.asp">shop more</a>
          			</td>
          		</tr>
          	</table>
        </div>
        <%
        rs.movenext
      wend
		%>
      </div>
      <div id="sessionTimeout" style="color:green">
      </div>
    </div>
  </td>
</tr>
</table>
  <!--#include file="include/footer.asp"-->
  </td>
</tr>
</table>
    <%
    cnn.close
	%>
</center>
  </body>
</html>