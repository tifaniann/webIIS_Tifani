<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data.Oledb" %>
<%@ Import Namespace="System.Threading" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="System.Security.Cryptography" %>
<%@ Import Namespace="System.Net.Mail" %>

<script runat="server">

    Dim connstringlintar As String = "Provider=SQLOLEDB;Data Source=DELL;Integrated Security=SSPI;Initial Catalog=lintar2022;"

    Dim dr As oledb.OleDbDataReader
    Dim cn As New OleDb.OleDbConnection(connstringlintar)
    Dim cmd,jmdjumlah As oledb.oledbCommand
    Dim adp as oledb.oledbdataadapter
    Dim dslist as new dataset("list")
    Dim dtlist,dtlist2,dtlist3,dtlist4,dtlist5,dtlist6,dtlist7,dtlist8,dtlist9 as datatable
    dim i,j,k,jmlrec,z as integer
    dim qry,bgc,ket as string

    Dim myPort As String = HttpContext.Current.Request.Url.Port
    Dim myHost As String = HttpContext.Current.Request.Url.Host
    Dim MyUrl As String = HttpContext.Current.Request.Url.Scheme & "://" & HttpContext.Current.Request.Url.Host
    Dim dirPath As String = HttpContext.Current.Request.Url.AbsolutePath
    Dim lpath() as string

    sub buka(qry as string)
        ' TULISKAN CODE UNTUK SISANYA
    end sub

    sub tutup()
        cn.close()
    end sub

    sub bukajml(qry as string)
        ' TULISKAN CODE UNTUK SISANYA
    end sub

    sub bukadoang()
        cn.open
    end sub

    sub simpan(qry as string)
        ' TULISKAN CODE UNTUK SISANYA
    end sub

    sub isidata(qry as string,nama as string)
        ' TULISKAN CODE UNTUK SISANYA
    end sub

    ' TULISKAN CODE UNTUK SISANYA