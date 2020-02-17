<%
Dim itemid
itemid = request("itemid")
Set cnn = Server.CreateObject("ADODB.Connection")
cnn.open "PROVIDER=SQLOLEDB;DATABASE=AuctionOnRails;DATA SOURCE=(local);User ID=sa;Password=coppersink21"
Set rs = cnn.execute("select image, itemname, price from items where theitemtosimilarid = '"&itemid&"'")
While not rs.eof
  %>
  <span style="color:brown;width:600px">
	<img onclick="emptyOutSimilarItems('similarItems')" src='<%=rs("image")%>'>
  </span>
  <%
  rs.movenext
Wend
cnn.close
%>