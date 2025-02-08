

<script runat="server">

    Dim connstringatt As String = "Provider=sqloledb;Data Source=10.200.120.83,1433;Network Library=DBMSSOCN;Initial Catalog=attmhsdev;User ID=sa;Password=dbTesting2023;connect timeout=200;pooling=false;max pool size=200"
   
	Dim dratt As oledb.oledbDataReader
    Dim cnatt As new oledb.oledbConnection(connstringatt)
    Dim cmdatt,jmdjatt As oledb.oledbCommand
    Dim adpatt as oledb.oledbdataadapter
    Dim dslistatt as new dataset("list")
    Dim dtlistatt,dtlistatt2,dtlistatt3,dtlistatt4,dtlistatt5 as datatable
	
    sub bukaatt(qry as string)
        cnatt.Open()
        cmdatt = New oledb.oledbCommand(qry,cnatt)
        dratt=cmdatt.executereader()
    end sub
    
    sub tutupatt()
        cnatt.close()
    end sub
    
    sub bukaattjml(qry as string)
        cnatt.Open()
        cmdatt = New oledb.oledbCommand(qry,cnatt)
        jmlrec =cmdatt.executescalar()
    end sub
    
    sub bukadoangatt()
        cnatt.open
    end sub
    
    sub simpanatt(qry as string)
        ' TULISKAN CODE UNTUK SISANYA
    end sub
    
    sub isidataatt(qry as string,nama as string)
      ' TULISKAN CODE UNTUK SISANYA
    end sub
    
    sub isidataatt2(qry as string,nama as string)
      ' TULISKAN CODE UNTUK SISANYA
    end sub
    
    ' TULISKAN CODE UNTUK SISANYA