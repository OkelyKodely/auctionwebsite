<html>
  <head>
	<link href="/include/bootstrap.min.css" rel="stylesheet" />
    <style>
      .main {
        text-align: left;
        width: 700px;
      }
      .accountform {
        color:gray;
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
    <table align="center" bgcolor="purple">
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

  dim fullname, userid, pw, pw2, address, city, state, postalcode, paypalseller
  paypalseller = request("paypalseller")
  fullname = request("fullname")
  userid = request("userid")
  pw = request("pw")
  pw2 = request("pw2")
  address = request("address")
  city = request("city")
  state = request("state")
  postalcode = request("postalcode")
  if fullname <> "" and pw = pw2 then
  cnn.execute("insert into account (paypalseller, fullname, userid, pw, address, city, state, postalcode, inputdate) values ('"&paypalseller&"', "&fullname&"','"&userid&"','"&pw&"','"&address&"','"&city&"','"&state&"','"&postalcode&"',getDate())")
  Response.Write "<script>alert('Registered');window.location.href='/index.asp';</script>"
  elseif pw <> pw2 then
  Response.Write "<script>alert('Passwords do not match');</script>"
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
      <td valign="top" bgcolor="maroon" width="861">
    <div class="main">
        <h3 style="color:white">#1 Fashion Auction Site in the world</h3>
        <h1 style="color:yellow"><nobr>Follow us on Facebook, Instagram, Youtube, & Twitter</nobr></h1>
      	<h1 style="color:white">Create Free Account</h1>
        <form action="" method="post">
          <table align="center" style="border:1px solid gray">
            <tr>
              <td width="700">
                <div class="accountform" style="padding:10px">
                When you create an account with us, you will be given a userid to use freely all you want,
                and you will be able to both buy and list to sell items here at a most convenient plan.  Enjoy and create your account at this time!</div>
              </td>
            </tr>
          </table>
          <Br>
          <table class="accountform" align="center" style="border:1px solid gray">
            <tr>
              <td width="200">
                <div style="padding:10px">
              Fullname:
            </div>
              </td>
              <td>
                <div style="padding:10px">
                <input type="text" name="fullname">
              </div>
              </td>
            </tr>
            <tr>
              <td width="200">
                <div style="padding:10px">
                Address:
              </div>
              </td>
              <td>
                <div style="padding:10px">
                <input type="text" name="address">
              </div>
              </td>
            </tr>
            <tr>
              <td width="200">
                <div style="padding:10px">
                City:
              </div>
              </td>
              <td>
                <div style="padding:10px">
                <input type="text" name="city">
              </div>
              </td>
            </tr>
            <tr>
              <td width="200">
                <div style="padding:10px">
                State:
              </div>
              </td>
              <td>
                <div style="padding:10px">
                <input type="text" name="state">
              </div>
              </td>
            </tr>
            <tr>
              <td width="200">
                <div style="padding:10px">
                Postal Code:
              </div>
              </td>
              <td>
                <div style="padding:10px">
                <input type="text" name="postalcode">
              </div>
              </td>
            </tr>
            <tr>
              <td width="200">
                <div style="padding:10px">
          Paypal ID: </div></td>
          <td>                <div style="padding:10px">
<input type="text" name="paypalseller">
</div></td>
          </tr>
            <tr>
              <td width="200">
                <div style="padding:10px">
          User ID: </div></td>
          <td>                <div style="padding:10px">
<input type="text" name="userid">
</div></td>
          </tr>
          <tr>
            <td width="200">                <div style="padding:10px">
PW: </div></td>
            <td>                <div style="padding:10px">
<input type="password" name="pw"></div></td>
          </tr>
          <tr>
            <td width="200">
                          <div style="padding:10px">
Confirm PW: </div></td>
          <td>                <div style="padding:10px">
<input type="password" name="pw2"></div>
          </td>
        </tr>
        <tr><Td width="100%" colspan="2" align="right">
          <br>
          <input type="submit" value="Register" style="color:green;position:relative;right:163px">          
          </Td></tr>
          </table>
        </form>
    </div>
    <%
    cnn.close
  	%>
    <div style="width:100%;text-align:center">
      <a href="login.asp">> Use My Free Account</a>
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