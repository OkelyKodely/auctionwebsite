<%
Set cnn = Server.CreateObject("ADODB.Connection")
cnn.open "PROVIDER=SQLOLEDB;DATABASE=AuctionOnRails;DATA SOURCE=(local);User ID=sa;Password=coppersink21"
Dim itemid
itemid = request("itemid")
Set rs = cnn.execute("select bidder,  itemid, itemname, price, description, image, sellerid from items where itemid = '"&itemid&"'")
If not rs.eof then
  If rs("bidder") <> "" Then
    cnn.execute("insert into itemswon (itemid, itemname, price, description, image, sellerid, bidder) values ('"&rs("itemid")&"', '"&rs("itemname")&"', "&rs("price")&", '"&rs("description")&"', '"&rs("image")&"', '"&rs("sellerid")&"', '"&rs("bidder")&"')")
  End if
  cnn.execute("delete from items where itemid = '"&itemid&"'")
End if
cnn.Close
%>