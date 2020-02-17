<%
Set cnn = Server.CreateObject("ADODB.Connection")
cnn.open "PROVIDER=SQLOLEDB;DATABASE=AuctionOnRails;DATA SOURCE=(local);User ID=sa;Password=coppersink21"
Set rs = cnn.execute("select itemid, convert(varchar, datediff(dd, input_timestamp, current_timestamp)) + ' Days ' + convert(varchar, datediff(hh, input_timestamp, current_timestamp) % 24) + ' Hours ' + convert(varchar, datediff(mi, input_timestamp, current_timestamp) % 60) + ' Minutes ' as remainder from items")
while not rs.eof
	Dim r, itemid
	r = rs("remainder")
	if r = "0 Days 0 Hours 0 Minutes " or r = "0 Days 0 Hours 1 Minutes " or r = "0 Days 0 Hours 2 Minutes " or r = "0 Days 0 Hours 3 Minutes " or r = "0 Days 0 Hours 4 Minutes " or r = "0 Days 0 Hours 5 Minutes " or r = "0 Days 0 Hours 6 Minutes " or r = "0 Days 0 Hours 7 Minutes " then
		itemid = rs("itemid")
		Set rss = cnn.execute("select bidder,  itemid, itemname, price, description, image, sellerid from items where itemid = '"&itemid&"'")
		If not rss.eof then
		  If rss("bidder") <> "" Then
		    cnn.execute("insert into itemswon (itemid, itemname, price, description, image, sellerid, bidder) values ('"&rss("itemid")&"', '"&rss("itemname")&"', "&rss("price")&", '"&rss("description")&"', '"&rss("image")&"', '"&rss("sellerid")&"', '"&rss("bidder")&"')")
		  End if
		  cnn.execute("delete from items where itemid = '"&itemid&"'")
		End if
	end if
	rs.movenext
wend
cnn.Close
%>