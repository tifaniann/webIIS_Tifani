
<script runat="server">



    Dim connstringEmail As String = "Provider=sqloledb;Data Source=10.200.120.53,1433;Network Library=DBMSSOCN;Initial Catalog=send_email;User ID=sa;Password=d3vPuskom;connect timeout=200;pooling=false;max pool size=200"



    Dim drEmail As OleDb.OleDbDataReader
    Dim cnEmail As New OleDb.OleDbConnection(connstringEmail)
    Dim cmdEmail, jmdjumlahEmail As OleDb.OleDbCommand
    Dim adpEmail As OleDb.OleDbDataAdapter
    Dim dslistEmail As New DataSet("list")
    Dim dtlistEmail, dtlistEmail2, dtlistEmail3, dtlistEmail4, dtlistEmail5, dtlistEmail6 As DataTable
    Dim dtlistEmail7, dtlistEmail8, dtlistEmail9, dtlistEmail10, dtlistEmail11, dtlistEmail12 As DataTable
    Dim jmlrecEmail As Integer
    'Dim qry, bgc, ket As String
    Dim qryEmail As String 

    Sub bukaEmail(qry As String)
        ' TULISKAN CODE UNTUK SISANYA
    End Sub

    Sub tutupEmail()
        cnEmail.Close()
    End Sub

    Sub bukajmlEmail(qry As String)
        ' TULISKAN CODE UNTUK SISANYA
    End Sub

    Sub bukadoangEmail()
        cnEmail.Open()
    End Sub

    Sub simpanEmail(qry As String)
        ' TULISKAN CODE UNTUK SISANYA
    End Sub

    Sub isidataEmail(qry As String, nama As String)
        ' TULISKAN CODE UNTUK SISANYA
    End Sub

    ' TULISKAN CODE UNTUK SISANYA