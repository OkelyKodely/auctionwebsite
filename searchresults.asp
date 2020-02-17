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
    <table align="center" bgcolor="purple">
      <tr>
        <td bgcolor="BLACK">
          <div style="width:600px;float:left">
            <a href="index.asp"><img src="/graphics/logo.png"></a><br>
            <a href="/category.asp?category=shorts"><img src="/graphics/shorts.png"></a>
            <a href="/category.asp?category=pants"><img src="/graphics/pants.png"></a>
            <a href="/category.asp?category=dresses"><img src="/graphics/dresses.png"></a>
            <a href="/category.asp?category=shoes"><img src="/graphics/shoes.png"></a>
            <a href="/category.asp?category=tops"><img src="/graphics/tops.png"></a>
            <a href="/category.asp?category=others"><img src="/graphics/others.png"></a>
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
  dim q, search
  q = request("q")
  search = request("search")
  if q <> "" or search <> "" then
    if q = "" then q = "sdfasdfasdfadfwe365rwerwerrwewerwer"
    if search = "" then search = "sdf234asdfasdfadfwerwerwerrwewerwer"
    set rs = cnn.execute("select * from items where itemname like '"&q&"%' or itemname like '"&search&"%'")
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
      <td bgcolor="maroon">&nbsp;</td>
      <td valign="top" bgcolor="maroon" style="color:orange" width="864">
        <%
        search = request("search")
        if q = "" then
        %>
        Results of Search keyword : <%=search%><br>
        <%
        else
        %>
        Results of Search keyword : <%=q%><br>
        <%
        end if
        %>
        <h3 style="color:white">#1 Fashion Auction Site in the world</h3>
    <div class="main">
      <div class="item" style="height:4000px">
<%
    while not rs.eof
%>
          <table width="100%" cellspacing="10" cellpadding="10">
            <tr>
              <td valign="top">
        <a class="text" href='view-item.asp?itemID=<%=rs("itemid")%>'>
          <img src='<%=rs("image")%>' width="220" height="220">
        </a>&nbsp;
                </td>
                <td style="color:white" valign="top" width="450">
          itemid <%=rs("itemid")%><br><br>
          <b><%=rs("itemname")%></b><br><br>
          $<%=rs("price")%><br><br>
          <div style="width:300px"><%=rs("description")%></div><br><br>
          <br><br><a href="index.asp">shop more</a>
                </td>
              </tr>
            </table>
        <%
        rs.movenext
      wend
    %>
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