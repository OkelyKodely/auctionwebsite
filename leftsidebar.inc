<%
dim cl
cl = request("close")
if left(request.querystring, 4) = "clos" then
%>
<a href="?<%=Replace(Replace(Request.QueryString,"close=true","close=false"),"&close","close")%>" style="color:yellow">|[^]|</a>
<a href="?<%=Replace(Replace(Request.QueryString,"close=false","close=true"),"&close","close")%>" style="color:yellow">|X|</a>
<%
else
if instr(request.querystring, "clos") > 0 then
%>
<a href="?<%=Replace(Replace(Request.QueryString,"close=true","close=false"),"close","close")%>" style="color:yellow">|[^]|</a>
<a href="?<%=Replace(Replace(Request.QueryString,"close=false","close=true"),"close","close")%>" style="color:yellow">|X|</a>
<%
else
  if len(request.querystring) > 0 then
%>
<a href="?<%=Replace(Replace(Request.QueryString,"close=true","close=false"),"close","close")%>&close=false" style="color:yellow">|[^]|</a>
<a href="?<%=Replace(Replace(Request.QueryString,"close=false","close=true"),"close","close")%>&close=true" style="color:yellow">|X|</a>
<%
  else
%>
<a href="?close=false" style="color:yellow">|[^]|</a>
<a href="?close=true" style="color:yellow">|X|</a>
<%
end if
end if
end if
dim close
close = request("close")
if close = "false" then
%>
  <div id="leftside" style="color:blue;width:200px;height:1222px;background-image:url(/graphics/leftsidebar-grad.jpg);">
    <a href="about.asp" style="color:blue"><img src=/graphics/dot.png> About</a>
    <BR>
      <a href="list-item.asp" style="color:blue">
       <img src="/graphics/dot.png"> List my item</a>
        <h4 style="color:black">SEARCH</h4>
        <form action="searchResults.asp" method="get">
          <nobr>: <input type="text" name="search" style="width:92px">
          <input type="submit" value="search"></nobr>
        </form>
        <table align="center" style="background-color:#aaccdd">
          <tr>
            <td style="text-align:center;width:33px;border:0px solid gray"><a href="/searchResults.asp?q=A"><span style="color:maroon">A</a></td>
            <td style="text-align:center;width:33px;border:0px solid gray"><a href="/searchResults.asp?q=B"><span style="color:maroon">B</a></td>
            <td style="text-align:center;width:33px;border:0px solid gray"><a href="/searchResults.asp?q=C"><span style="color:maroon">C</a></td>
            <td style="text-align:center;width:33px;border:0px solid gray"><a href="/searchResults.asp?q=D"><span style="color:maroon">D</a></td>
          </tr>
          <tr>
            <td style="text-align:center;width:33px;border:0px solid gray"><a href="/searchResults.asp?q=E"><span style="color:maroon">E</a></td>
            <td style="text-align:center;width:33px;border:0px solid gray"><a href="/searchResults.asp?q=F"><span style="color:maroon">F</a></td>
            <td style="text-align:center;width:33px;border:0px solid gray"><a href="/searchResults.asp?q=G"><span style="color:maroon">G</a></td>
            <td style="text-align:center;width:33px;border:0px solid gray"><a href="/searchResults.asp?q=H"><span style="color:maroon">H</a></td>
          </tr>
          <tr>
            <td style="text-align:center;width:33px;border:0px solid gray"><a href="/searchResults.asp?q=I"><span style="color:maroon">I</a></td>
            <td style="text-align:center;width:33px;border:0px solid gray"><a href="/searchResults.asp?q=J"><span style="color:maroon">J</a></td>
            <td style="text-align:center;width:33px;border:0px solid gray"><a href="/searchResults.asp?q=K"><span style="color:maroon">K</a></td>
            <td style="text-align:center;width:33px;border:0px solid gray"><a href="/searchResults.asp?q=L"><span style="color:maroon">L</a></td>
          </tr>
          <tr>
            <td style="text-align:center;width:33px;border:0px solid gray"><a href="/searchResults.asp?q=M"><span style="color:maroon">M</a></td>
            <td style="text-align:center;width:33px;border:0px solid gray"><a href="/searchResults.asp?q=N"><span style="color:maroon">N</a></td>
            <td style="text-align:center;width:33px;border:0px solid gray"><a href="/searchResults.asp?q=O"><span style="color:maroon">O</a></td>
            <td style="text-align:center;width:33px;border:0px solid gray"><a href="/searchResults.asp?q=P"><span style="color:maroon">P</a></td>
          </tr>
          <tr>
            <td style="text-align:center;width:33px;border:0px solid gray"><a href="/searchResults.asp?q=Q"><span style="color:maroon">Q</a></td>
            <td style="text-align:center;width:33px;border:0px solid gray"><a href="/searchResults.asp?q=R"><span style="color:maroon">R</a></td>
            <td style="text-align:center;width:33px;border:0px solid gray"><a href="/searchResults.asp?q=S"><span style="color:maroon">S</a></td>
            <td style="text-align:center;width:33px;border:0px solid gray"><a href="/searchResults.asp?q=T"><span style="color:maroon">T</a></td>
          </tr>
          <tr>
            <td style="text-align:center;width:33px;border:0px solid gray"><a href="/searchResults.asp?q=U"><span style="color:maroon">U</a></td>
            <td style="text-align:center;width:33px;border:0px solid gray"><a href="/searchResults.asp?q=V"><span style="color:maroon">V</a></td>
            <td style="text-align:center;width:33px;border:0px solid gray"><a href="/searchResults.asp?q=W"><span style="color:maroon">W</a></td>
            <td style="text-align:center;width:33px;border:0px solid gray"><a href="/searchResults.asp?q=X"><span style="color:maroon">X</a></td>
          </tr>
          <tr>
            <td style="text-align:center;width:33px;border:0px solid gray"><a href="/searchResults.asp?q=Y"><span style="color:maroon">Y</a></td>
            <td style="text-align:center;width:33px;border:0px solid gray"><a href="/searchResults.asp?q=Z"><span style="color:maroon">Z</a></td>
            <td style="text-align:center;width:33px;border:0px solid gray">&nbsp;</td>
          </tr>
        </table>
        <h4 style="color:black">Hours of Operation</h4>
        <font size="2">Monday thru Friday 10:00 AM to 6:00 PM</font><br>
        
        <h4 style="color:black">Notice</h4>
        <font size="2"><img src="/graphics/dot.png"> We will be making system wide upgrades this Friday between 10:00 AM and 12:00 PM</font><br><br>
        <script language="javascript">
        var d = new Date();
        if(d.getHours() < 8 || d.getHours() > 17) {
          document.write('<font size=3 color=red><img src=/graphics/dot.png> We are closed</font>');
        }
        else {
          document.write('<font size=3 color=green><img src=/graphics/dot.png> We are open</font>');
        }
        </script>
        <br>
        <h4 style="color:black"><a href="/contact.asp" style="color:blue"><img src="/graphics/dot.png"> Contact us</a></h4>        
</div>
<%
end if
%>