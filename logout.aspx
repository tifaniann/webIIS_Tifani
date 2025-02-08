<script runat="server">
    sub page_load ( o as object, e as eventargs)
        if not page.ispostback then
        end if
        session.removeall()
        Response.Redirect("index.aspx")
    End sub
</script>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body>
  <center>
  <div id="main">
    <br>LOGOUT<br>
  </div>
  </center>
</body>
</html>
