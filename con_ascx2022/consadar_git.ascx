<script runat="server">


    Dim connstringfti As String = "Provider=SQLOLEDB;Data Source=DELL;Integrated Security=SSPI;Initial Catalog=HRD_260616a;"

    Dim drsdr As oledb.oledbDataReader
    Dim cnsdr As new oledb.oledbConnection(connstringfti) 
    Dim cmdsdr As oledb.oledbCommand
    Dim adpsdr as oledb.oledbdataadapter
    Dim dslistsdr as new dataset("list")
    Dim dtlistsdr, dtlistsdr2, dtlistsdr3, dtlistsdr4, dtlistsdr5, dtlistsdr6, dtlistsdr7 As datatable
    Dim ljammsk,ljamklr,labsmsk,labsklr,lket as string
    dim ltlt,lplg,lbih,ljml as integer
    dim jpla,jipla,jpta,jlembur,tot_pla,tot_lembur,tot_lebih as integer
    dim jcuti,jalpa,jmlrecsdr as integer
    dim tot_ljmljker,ljmljker,jhdr as integer
    dim jtlt,jidt,jdta,tot_telat as integer

    'dim connstringabsen as string="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Program Files\Att2008\att2000.mdb;User Id=admin"    
    dim connstringabsen as string="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=d:\ATT2000.mdb;User Id=Admin;"
    Dim drabs As oledb.oledbDataReader
    Dim cnabs As new oledb.oledbConnection(connstringabsen)
    Dim cmdabs,jmdjumlahabs As oledb.oledbCommand
    Dim adpabs as oledb.oledbdataadapter
    Dim dslistabs as new dataset("list")
    Dim dtlistabs as datatable
    ''Provider=Microsoft.Jet.OLEDB.4.0;Data Source=\\serverName\shareName\folder\myDatabase.mdb;User Id=admin;Password=;

    sub bukaabs(qry as string)
        ' TULISKAN CODE UNTUK SISANYA
    end sub

    sub tutupabs()
        ' TULISKAN CODE UNTUK SISANYA
    end sub

    sub isidataabs(qry as string,nama as string)
        ' TULISKAN CODE UNTUK SISANYA
    end sub

    sub bukasdr(qry as string)
        ' TULISKAN CODE UNTUK SISANYA
    end sub

    sub tutupsdr()
        cnsdr.close()
    end sub

    sub bukajmlsdr(qry as string)
        ' TULISKAN CODE UNTUK SISANYA
    end sub

    sub bukadoangsdr()
        cnsdr.open
    end sub

    sub simpansdr(qry as string)
        ' TULISKAN CODE UNTUK SISANYA
    end sub

    sub isidatasdr(qry as string,nama as string)
        ' TULISKAN CODE UNTUK SISANYA
    end sub

    sub isidatasdr2(qry as string,nama as string)
        ' TULISKAN CODE UNTUK SISANYA
    end sub

    sub isidatasdr3(qry as string,nama as string)
        ' TULISKAN CODE UNTUK SISANYA
    end sub

    
' TULISKAN CODE UNTUK SISANYA