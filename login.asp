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
      <div style="float:left;width:1500px">
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
  dim userid, pw
  userid = request("userid")
  pw = request("pw")
  if userid <> "" then
  set rs = cnn.execute("select * from account where userid = '"&userid&"' and pw = '"&pw&"'")
  if not rs.eof then
    Session("userid") = userid
    response.redirect "index.asp"
  else
    response.write "<script>alert('That account does not exist or has been removed');</script>"
  end if
  end if
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
      <td valign="top" bgcolor="maroon">
        <h3 style="color:white">#1 Fashion Auction Site in the world</h3>
        <h1 style="color:yellow">Follow us on Facebook, Instagram, Youtube, & Twitter</h1>
    <div class="main">
      <div class="item">
		<table width="100%" style="position:relative;top:-38px" align="center">
<tr>
<td align="center">
        <form action="" method="post">
        <h1>Login</h1>
		<table align="center">
			<tr>
<td VALIGN=TOP>
          User ID: </td><td /><td><input type="text" name="userid"></td>
</tr>
<tr>
<td VALIGN=TOP>
          PW: </td><td/><td><input type="password" name="pw">         <br><br><BR> <input type="submit" value="Login"><BR><BR>
    <div style="width:100%;text-align:center">
      <a href="create-free-account.asp">Create My Free Account</a>
    </div>
    <br><br>
</td>
</tr>
</table>
        </form>
</td>
</tr>
</table>
      </div>
    </div>
    <%
    cnn.close
	  %>
  </td>
</tr>
</table>
  <!--#include file="include/footer.asp"-->
</center>
  </body>
</html>