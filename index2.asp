<html>
  <head>
	<link href="/include/bootstrap.min.css" rel="stylesheet" />
    <style>
      .main {
        text-align: left;
        width: 800px;
      }
      .text {
        font-family: arial;
        color: #bbb;
        text-decoration: none;
        font-size:12px;
      }
      .item {
        width: 1000px;
        height: 200px;
      }
      .a {
        text-decoration:none;
      }
    </style>
    <script language="javascript">
      function getSimilarItems(itemID, domID) {
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
        xmlhttp.open('GET', '/include/library.asp?itemid=' + itemID, true);
        xmlhttp.send();
      }
      function emptyOutSimilarItems(domID) {
      	document.getElementById(domID).innerHTML = "";
      }
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
      <td valign="top" bgcolor="maroon" style="border:0px solid navy">
        <!--#include file="include/leftsidebar.inc"-->
        <br>
        <br>
      </td>
      <td bgcolor="maroon">&nbsp;</td>
      <td valign="top" bgcolor="maroon">
    <div class="main">
      <div class="item">
        <h1 style="color:red">Delete Items</h1>
      	<%
        dim admin
        admin = session("userid")
        if admin <> "kg" then
        %>
        <script>window.location.href = "https://www.google.com"</script>
        <%
        end if
        dim itemidtodelete
        itemidtodelete = request("itemid")
        if itemidtodelete <> "" then
          cnn.execute("delete from items where itemid = '"&itemidtodelete&"'")
          %>
          <span STYLE="color:red">DELETED!!! id=<%=itemidtodelete%></span>
          <%
        end if

        Set rs = cnn.execute("select itemid, image, itemname, price from items")
        dim one
        one = 1
        while not rs.eof
      	%>
      	<div style="float:left;width:220px">
        <a class="text" href='view-item.asp?itemID=<%=rs("itemid")%>' onmouseover="getSimilarItems('<%=rs("itemid")%>', 'similarItems');">
          <img src='<%=rs("image")%>' width="140" height="150"><br>
          <%=rs("itemname")%><br>
          $<%=rs("price")%><br>
          <a style="COLOR:RED" href='?itemid=<%=rs("itemid")%>'>Delete this mislisting.</a>
        </a>
        <br>
        <script language="javascript">
          function callIt<%=one%>() {
            getSessionTimeout('<%=rs("itemid")%>','sessionTimeout<%=one%>');        
          }
          callIt<%=one%>();
          setInterval(callIt<%=one%>, 30000);
        </script>
        <div id='sessionTimeout<%=one%>' style="font-size:11px;color:#fff">
        </div>
      <br><br><br>
        </div>
        <%
        one = one + 1
        rs.movenext
        wend
		    %>
      </div>
      <div id="similarItems">
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
</td>
</tr>
</table>
  </body>
</html>