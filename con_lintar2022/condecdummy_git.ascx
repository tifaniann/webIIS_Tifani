<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.Oledb" %>
<%@ Import Namespace="System.Threading" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="System.Security.Cryptography" %>

<%@ Import Namespace="System.Net.Mail" %>
<script runat="server"> 
    'sql2012
    Dim connstringdec As String = "Provider=SQLOLEDB;Data Source=DELL;Integrated Security=SSPI;Initial Catalog=dec_dummy;"


   
	Dim drdec As oledb.oledbDataReader
    Dim cndec As new oledb.oledbConnection(connstringdec)
    Dim cmddec As oledb.oledbCommand
    Dim adpdec as oledb.oledbdataadapter
    Dim dslistdec as new dataset("list")
    Dim dtlistdec,dtlistdec2,dtlistdec3,dtlistdec4,dtlistdec5,dtlistdec6 as datatable
	
    sub bukadec(qry as string)
        ' TULISKAN CODE UNTUK SISANYA
    end sub
    
    sub tutupdec()
        cndec.close()
    end sub
    
    
    sub bukadoangdec()
        cndec.open
    end sub
    
    sub simpandec(qry as string)
        ' TULISKAN CODE UNTUK SISANYA
    end sub
    
    sub isidatadec(qry as string,nama as string)
      ' TULISKAN CODE UNTUK SISANYA
    end sub
    
    sub isidatadec2(qry as string,nama as string)
      ' TULISKAN CODE UNTUK SISANYA
    end sub

    sub isidatadec3(qry as string,nama as string)
      ' TULISKAN CODE UNTUK SISANYA
    end sub
    
    sub isidatadec4(qry as string,nama as string)
      ' TULISKAN CODE UNTUK SISANYA
    end sub
    
    sub isidatadec5(qry as string,nama as string)
      ' TULISKAN CODE UNTUK SISANYA
    end sub
    
     sub isidatadec6(qry as string,nama as string)
      ' TULISKAN CODE UNTUK SISANYA
    end sub

    sub bukajmldec(qry as string)
        ' TULISKAN CODE UNTUK SISANYA
    end sub

   
</script>

