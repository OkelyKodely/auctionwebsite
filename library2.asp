<%
Dim itemid
itemid = request("itemid")
Set cnn = Server.CreateObject("ADODB.Connection")
cnn.open "PROVIDER=SQLOLEDB;DATABASE=AuctionOnRails;DATA SOURCE=(local);User ID=sa;Password=coppersink21"
Set rs = cnn.execute("select convert(varchar, datediff(dd, input_timestamp, current_timestamp)) + ' Days ' + convert(varchar, datediff(hh, input_timestamp, current_timestamp) % 24) + ' Hours ' + convert(varchar, datediff(mi, input_timestamp, current_timestamp) % 60) + ' Minutes ' as remainder from items where itemid = '"&itemid&"'")
If not rs.eof then
	if rs("remainder") = "0 Days 0 Hours 0 Minutes " then
		response.write "Auction is closed on this item.  DO NOT CLICK!!"
	else
		response.write replace(rs("remainder"),"-","") & " remaining"
	end if
End if
cnn.close
%>