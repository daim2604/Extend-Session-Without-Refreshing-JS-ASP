<%
  response.write(session.timeout & " - divider -  " & session("nama") & " - A<br/>" )
  response.write(130 mod 60 & "<br/>")
  response.write(floor(130/60))

  function floor(e)
    dim val
    if cdbl(e) < cdbl(cint(e)) then
      val = cint(e) - 1
    else
      val = cint(e)
    end if
    floor = val
  end function
%>
