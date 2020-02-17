<html>
  <head>
    <meta keywords="fashion, auction, free listing of selling and buying online free, tops, dresses, shoes, others">
    <meta description="fashion, auction, and free listing of selling and buying online free.">
  	<link href="/include/bootstrap.min.css" rel="stylesheet" />
    <style>
      .main {
        text-align: center;
        width: 700px;
      }
      .text {
        font-family: arial;
        color: gray;
        text-decoration: none;
      }
      .item {
        width: 600px;
        height: 200px;
      }
    </style>
    <%
    Set cnn = Server.CreateObject("ADODB.Connection")
    cnn.open "PROVIDER=SQLOLEDB;DATABASE=AuctionOnRails;DATA SOURCE=(local);User ID=sa;Password=coppersink21"
    dim itemID
    itemid = request("itemid")
    Set rs = cnn.execute("select itemid, description, image, itemname, price from items where itemid = '"&itemid&"'")
    if not rs.eof then
    %>
    <script language="javascript">
      function getSessionTimeout(itemID, domID) {
        var xmlhttp = new XMLHttpRequest();
        var str = "";
        xmlhttp.onreadystatechange = function() {
	        if(xmlhttp.readyState == XMLHttpRequest.DONE) {
	        	str = xmlhttp.responseText;
	        } else {
	        	str = "";
	        }
	        var obj = document.getElementById(domID);
    	    obj.innerHTML = str;
    	}
        xmlhttp.open('GET', '/include/library2.asp?itemid=' + itemID, true);
        xmlhttp.send();
      }
      function callIt() {
        getSessionTimeout('<%=itemid%>','sessionTimeout');        
      }
      callIt();
      setInterval(callIt, 30000);
    </script>
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
  Set cnn = Server.CreateObject("ADODB.Connection")
  cnn.open "PROVIDER=SQLOLEDB;DATABASE=AuctionOnRails;DATA SOURCE=(local);User ID=sa;Password=coppersink21"
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
        <h3 style="color:white">#1 Auction Site in the world</h3>
<b style="color:red;font-size:42px"><%=rs("itemname")%></b>    <div class="main">
      <div class="item">
      	<div style="float:left">
      		<table width="100%" cellspacing="10" cellpadding="10">
      			<tr>
      				<td valign="top">
			      		<img src="/graphics/view-item-strip.png">
			      		&nbsp;
      				</td>
      				<td valign="top">
        <a class="text" href='view-item.asp?itemID=<%=rs("itemid")%>'>
          <img src='<%=rs("image")%>' width="340" height="340">
        </a>&nbsp;
          			</td>
                <td >&nbsp;</td>
          			<td valign="top" style="color:white">
          id <%=rs("itemid")%><br><br>
          <b><%=rs("itemname")%></b><br><br>
          $<%=rs("price")%><br><br>
          <div style="width:300px"><%=rs("description")%></div><br><br>
          <div id="sessionTimeout" style="color:green;float:left">
          </div>
          <br><br><a href="index.asp">Shop more</a>
          <br><br><a href='bid.asp?itemid=<%=rs("itemid")%>' style="color:gray;background-color:black;">Bid on this item</a>
          			</td>
          		</tr>
          	</table>
        </div>
        <%
        end if
		%>
      </div>
    </div>
    </td>
  </tr>
</table>
    <%
    cnn.close
	%>
  <!--#include file="include/footer.asp"-->
</center>
  </body>
</html>