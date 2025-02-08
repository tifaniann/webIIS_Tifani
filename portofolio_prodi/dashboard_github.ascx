<!-- #INCLUDE file ="../../con_ascx2022/condecdummy.ascx" -->
<!-- #INCLUDE file ="../../con_ascx2022/conlintar2022.ascx" -->
<!-- #INCLUDE file ="../../con_ascx2022/conatt.ascx" -->
<!-- #INCLUDE file ="../../con_ascx2022/consadar.ascx" -->

<%@ Import Namespace="System.Web.Script.Serialization" %>

<script runat="server"> 
    Dim statustetap, statustdktetap, jmldosenjdw, tahunstatus, tahunjadwal, tahungelar, gelarp6, gelarp7, pssendiribim, pslainbim, tahunbimbinganbim
    Dim jml_tetap, jml_tidak, unitkerja, strDiploma, strMagister, strSarjana, strDoktor

    Dim tahun_lulusan, jml_lulus, jml_lacak, jml_sesuai, jml_tidak2
    Dim tahun_IPK, ipk_min, ipk_max, ipk_avg, tahun_Lulus, jml_lulus2
    Dim tahun_lulusan3, jml_lulus3, jml_lacak3, t_lokal, t_nasional, t_multi
    Dim tahun_lulusan4, jml_lulus4, jml_lacak4, jml_6bln, jml618bln, jml_18bln
    dim tahun_ang, jml_terima, jml_lulus5

    Dim tahuncalon, tahunnew, tahunaktif, calonpen_mhs, calonlulus_mhs, newreg_mhs, newtrf_mhs, aktifreg_mhs, aktiftrf_mhs

    sub page_load ( o as object, e as eventargs) 
        cekauthlintar()
        
        if not page.ispostback then
            isi_isi()
            isi_grafik()
            isi_grafik_dsn()
            dropdowndata()
            lbljudulchart.text = "Dosen"
            lbljudulkpi.text = "KPI Dosen"
            pnlratio.visible = true

            Dim kodeJur As String = Session("kodejurnim").ToString()
            Dim serializer As New JavaScriptSerializer()
            ' DOSEN
            Dim yearListAKF As List(Of String) = YearsAKF(kodeJur)
            Dim yearListTDP As List(Of String) = YearsTDP(kodeJur)
            Dim yearListTTP As List(Of String) = YearsTTP(kodeJur)
            Dim yearListMGR As List(Of String) = YearsMGR(kodeJur)
            Dim yearListDKR As List(Of String) = YearsDKR(kodeJur)
            Dim yearListPSS As List(Of String) = YearsPSS(kodeJur)
            Dim yearListPSL As List(Of String) = YearsPSL(kodeJur)
            Dim thresholdJsonAKF As String = serializer.Serialize(GetKpiAKF(kodeJur, yearListAKF))
            Dim thresholdJsonTDP As String = serializer.Serialize(GetKpiTDP(kodeJur, yearListTDP))
            Dim thresholdJsonTTP As String = serializer.Serialize(GetKpiTTP(kodeJur, yearListTTP))
            Dim thresholdJsonMGR As String = serializer.Serialize(GetKpiMGR(kodeJur, yearListMGR))
            Dim thresholdJsonDKR As String = serializer.Serialize(GetKpiDKR(kodeJur, yearListDKR))
            Dim thresholdJsonPSS As String = serializer.Serialize(GetKpiPSS(kodeJur, yearListPSS))
            Dim thresholdJsonPSL As String = serializer.Serialize(GetKpiPSL(kodeJur, yearListPSL))
            thresholdAKF.Text = thresholdJsonAKF
            thresholdTDP.Text = thresholdJsonTDP
            thresholdTTP.Text = thresholdJsonTTP
            thresholdMGR.Text = thresholdJsonMGR
            thresholdDKR.Text = thresholdJsonDKR
            thresholdPSS.Text = thresholdJsonPSS
            thresholdPSL.Text = thresholdJsonPSL

            ' TENAGA PENDIDIKAN
            Dim kodeJur2 As String = Session("kodejurnim").ToString()
            Dim yearListTDP2 As List(Of String) = YearsTDP2(kodeJur2)
            Dim yearListTTP2 As List(Of String) = YearsTTP2(kodeJur2)
            Dim yearListMGR2 As List(Of String) = YearsMGR2(kodeJur2)
            Dim yearListDKR2 As List(Of String) = YearsDKR2(kodeJur2)
            Dim yearListSRJ2 As List(Of String) = YearsSRJ2(kodeJur2)
            Dim yearListDIP2 As List(Of String) = YearsDIP2(kodeJur2)
            Dim serializer2 As New JavaScriptSerializer()
            Dim thresholdJsonTDP2 As String = serializer2.Serialize(GetKpiTDP2(kodeJur2, yearListTDP2))
            Dim thresholdJsonTTP2 As String = serializer2.Serialize(GetKpiTTP2(kodeJur2, yearListTTP2))
            Dim thresholdJsonMGR2 As String = serializer2.Serialize(GetKpiMGR2(kodeJur2, yearListMGR2))
            Dim thresholdJsonDKR2 As String = serializer2.Serialize(GetKpiDKR2(kodeJur2, yearListDKR2))
            Dim thresholdJsonSRJ2 As String = serializer2.Serialize(GetKpiSRJ2(kodeJur2, yearListSRJ2))
            Dim thresholdJsonDIP2 As String = serializer2.Serialize(GetKpiDIP2(kodeJur2, yearListDIP2))
            thresholdTDP2.Text = thresholdJsonTDP2
            thresholdTTP2.Text = thresholdJsonTTP2
            thresholdMGR2.Text = thresholdJsonMGR2
            thresholdDKR2.Text = thresholdJsonDKR2
            thresholdSRJ2.Text = thresholdJsonSRJ2
            thresholdDIP2.Text = thresholdJsonDIP2

            'MHS BID KERJA
            Dim yearListSSI As List(Of String) = YearsSSI(kodeJur)
            Dim yearListTSI As List(Of String) = YearsTSI(kodeJur)
            Dim yearList_6 As List(Of String) = Years_6(kodeJur)
            Dim thresholdJsonSSI As String = serializer.Serialize(GetKpiSSI(kodeJur, yearListSSI))
            Dim thresholdJsonTSI As String = serializer.Serialize(GetKpiTSI(kodeJur, yearListTSI))
            Dim thresholdJson_6 As String = serializer.Serialize(GetKpi_6(kodeJur, yearList_6))
            threshold_6.Text = thresholdJson_6
            thresholdSSI.Text = thresholdJsonSSI
            thresholdTSI.Text = thresholdJsonTSI

            'MHS IPK LULUSAN
            Dim yearListIAV As List(Of String) = YearsIAV(kodeJur)
            Dim yearListIMX As List(Of String) = YearsIMX(kodeJur)
            Dim yearListIMN As List(Of String) = YearsIMN(kodeJur)
            Dim yearList_62 As List(Of String) = Years_62(kodeJur)
            Dim thresholdJsonIAV As String = serializer.Serialize(GetKpiIAV(kodeJur, yearListIAV))
            Dim thresholdJsonIMX As String = serializer.Serialize(GetKpiIMX(kodeJur, yearListIMX))
            Dim thresholdJsonIMN As String = serializer.Serialize(GetKpiIMN(kodeJur, yearListIMN))
            Dim thresholdJson_62 As String = serializer.Serialize(GetKpi_62(kodeJur, yearList_62))
            thresholdIAV.Text = thresholdJsonIAV
            thresholdIMX.Text = thresholdJsonIMX
            thresholdIMN.Text = thresholdJsonIMN
            threshold_62.Text = thresholdJson_62

            'MHS JANGKAUAN
            Dim yearListLOK As List(Of String) = YearsLOK(kodeJur)
            Dim yearListMUL As List(Of String) = YearsMUL(kodeJur)
            Dim yearListNAS As List(Of String) = YearsNAS(kodeJur)
            Dim yearList_63 As List(Of String) = Years_63(kodeJur)
            Dim thresholdJsonLOK As String = serializer.Serialize(GetKpiLOK(kodeJur, yearListLOK))
            Dim thresholdJsonMUL As String = serializer.Serialize(GetKpiMUL(kodeJur, yearListMUL))
            Dim thresholdJsonNAS As String = serializer.Serialize(GetKpiNAS(kodeJur, yearListNAS))
            Dim thresholdJson_63 As String = serializer.Serialize(GetKpi_63(kodeJur, yearList_63))
            thresholdLOK.Text = thresholdJsonLOK
            thresholdMUL.Text = thresholdJsonMUL
            thresholdNAS.Text = thresholdJsonNAS
            threshold_63.Text = thresholdJson_63

            'MHS WAKTU TUNGGU
            Dim yearListT06 As List(Of String) = YearsT06(kodeJur)
            Dim yearListT18 As List(Of String) = YearsT18(kodeJur)
            Dim yearListL18 As List(Of String) = YearsL18(kodeJur)
            Dim yearList_64 As List(Of String) = Years_64(kodeJur)
            Dim thresholdJsonT06 As String = serializer.Serialize(GetKpiT06(kodeJur, yearListT06))
            Dim thresholdJsonT18 As String = serializer.Serialize(GetKpiT18(kodeJur, yearListT18))
            Dim thresholdJsonL18 As String = serializer.Serialize(GetKpiL18(kodeJur, yearListL18))
            Dim thresholdJson_64 As String = serializer.Serialize(GetKpi_64(kodeJur, yearList_64))
            thresholdT06.Text = thresholdJsonT06
            thresholdT18.Text = thresholdJsonT18
            thresholdL18.Text = thresholdJsonL18
            threshold_64.Text = thresholdJson_64

            'MHS LULUSAN TEPAT WAKTU
            Dim yearListJDT As List(Of String) = YearsJDT(kodeJur)
            Dim yearListJLL As List(Of String) = YearsJLL(kodeJur)
            Dim thresholdJsonJDT As String = serializer.Serialize(GetKpiJDT(kodeJur, yearListJDT))
            Dim thresholdJsonJLL As String = serializer.Serialize(GetKpiJLL(kodeJur, yearListJLL))
            thresholdJDT.Text = thresholdJsonJDT
            thresholdJLL.Text = thresholdJsonJLL

            'MHS 
            Dim yearListCLN As List(Of String) = YearsCLN(kodeJur)
            Dim yearListLLS As List(Of String) = YearsLLS(kodeJur)
            Dim yearListREG_1 As List(Of String) = YearsREG_1(kodeJur)
            Dim yearListTRF_1 As List(Of String) = YearsTRF_1(kodeJur)
            Dim yearListREG_2 As List(Of String) = YearsREG_2(kodeJur)
            Dim yearListTRF_2 As List(Of String) = YearsTRF_2(kodeJur)
            Dim thresholdJsonCLN As String = serializer.Serialize(GetKpiCLN(kodeJur, yearListCLN))
            Dim thresholdJsonLLS As String = serializer.Serialize(GetKpiLLS(kodeJur, yearListLLS))
            Dim thresholdJsonREG_1 As String = serializer.Serialize(GetKpiREG_1(kodeJur, yearListREG_1))
            Dim thresholdJsonTRF_1 As String = serializer.Serialize(GetKpiTRF_1(kodeJur, yearListTRF_1))
            Dim thresholdJsonREG_2 As String = serializer.Serialize(GetKpiREG_2(kodeJur, yearListREG_2))
            Dim thresholdJsonTRF_2 As String = serializer.Serialize(GetKpiTRF_2(kodeJur, yearListTRF_2))
            thresholdCLN.Text = thresholdJsonCLN
            thresholdLLS.Text = thresholdJsonLLS
            thresholdREG_1.Text = thresholdJsonREG_1
            thresholdTRF_1.Text = thresholdJsonTRF_1
            thresholdREG_2.Text = thresholdJsonREG_2
            thresholdTRF_2.Text = thresholdJsonTRF_2
		End If
    End sub

    ' ==== DOSEN =====
    Private Function GetKpiPSS(kodeJurKPIPSS As String, yearListKPIPSS As List(Of String)) As Dictionary(Of String, Integer)
        Dim thresholdsPSS As New Dictionary(Of String, Integer)

        For Each year As String In yearListKPIPSS
            Dim qry As String = "SELECT jumlah_target_dt FROM t_target_detail " &
                                "WHERE kpi_id = 4 AND kode_elemen_dt = 'PSS' " &
                                "AND kode_jur = '" & kodeJurKPIPSS & "' AND LEFT(th_akdk, 4) = '" & year & "'"
            
            ' Execute the query and store the result
            isidatasdr(qry, "targetDetailPSS")
            If dtlistsdr.Rows.Count > 0 AndAlso Not IsDBNull(dtlistsdr.Rows(0)("jumlah_target_dt")) Then
                thresholdsPSS.Add(year, Convert.ToInt32(dtlistsdr.Rows(0)("jumlah_target_dt")))
            End If
            tutupsdr()
        Next

        Return thresholdsPSS
        dtlistsdr.clear()
    End Function

    Private Function GetKpiPSL(kodeJurKPIPSL As String, yearListKPIPSL As List(Of String)) As Dictionary(Of String, Integer)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function YearsPSS(kodeJurPSS As String) As List(Of String)
        Dim yearListPSS As New List(Of String)
        qry= "SELECT DISTINCT LEFT(th_akdk, 4) AS year FROM t_target_detail " &
            "WHERE kode_jur = '" & kodeJurPSS & "' AND kpi_id = 4 AND kode_elemen_dt = 'PSS'"
        
        isidatasdr(qry, "yearResultPSS")
        For Each row As DataRow In dtlistSdr.Rows
            If Not IsDBNull(row("year")) Then
                yearListPSS.Add(row("year").ToString())
            End If
        Next
        tutupsdr()

        Return yearListPSS
        dtlistsdr.clear()
    End Function

    Private Function YearsPSL(kodeJurPSL As String) As List(Of String)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function GetKpiAKF(kodeJurKPIAKF As String, yearListKPIAKF As List(Of String)) As Dictionary(Of String, Integer)
        Dim thresholdsAKF As New Dictionary(Of String, Integer)

        For Each year As String In yearListKPIAKF
            Dim qry As String = "SELECT jumlah_target_dt FROM t_target_detail " &
                                "WHERE kpi_id = 4 AND kode_elemen_dt = 'AKF' " &
                                "AND kode_jur = '" & kodeJurKPIAKF & "' AND LEFT(th_akdk, 4) = '" & year & "'"
            
            ' Execute the query and store the result
            isidatasdr(qry, "targetDetailAKF")
            If dtlistsdr.Rows.Count > 0 AndAlso Not IsDBNull(dtlistsdr.Rows(0)("jumlah_target_dt")) Then
                thresholdsAKF.Add(year, Convert.ToInt32(dtlistsdr.Rows(0)("jumlah_target_dt")))
            End If
            tutupsdr()
        Next

        Return thresholdsAKF
        dtlistsdr.clear()
    End Function

    Private Function GetKpiTDP(kodeJurKPITDP As String, yearListKPITDP As List(Of String)) As Dictionary(Of String, Integer)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function GetKpiTTP(kodeJurKPITTP As String, yearListKPITTP As List(Of String)) As Dictionary(Of String, Integer)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function GetKpiMGR(kodeJurKPIMGR As String, yearListKPIMGR As List(Of String)) As Dictionary(Of String, Integer)
        Dim thresholdsMGR As New Dictionary(Of String, Integer)

        For Each year As String In yearListKPIMGR
            Dim qry As String = "SELECT jumlah_target_dt FROM t_target_detail " &
                                "WHERE kpi_id = 4 AND kode_elemen_dt = 'MGR' " &
                                "AND kode_jur = '" & kodeJurKPIMGR & "' AND LEFT(th_akdk, 4) = '" & year & "'"
            
            ' Execute the query and store the result
            isidatasdr(qry, "targetDetailMGR")
            If dtlistsdr.Rows.Count > 0 AndAlso Not IsDBNull(dtlistsdr.Rows(0)("jumlah_target_dt")) Then
                thresholdsMGR.Add(year, Convert.ToInt32(dtlistsdr.Rows(0)("jumlah_target_dt")))
            End If
            tutupsdr()
        Next

        Return thresholdsMGR
        dtlistsdr.clear()
    End Function

    Private Function GetKpiDKR(kodeJurKPIDKR As String, yearListKPIDKR As List(Of String)) As Dictionary(Of String, Integer)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function YearsAKF(kodeJurAKF As String) As List(Of String)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function YearsTDP(kodeJurTDP As String) As List(Of String)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function YearsTTP(kodeJurTTP As String) As List(Of String)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function YearsDKR(kodeJurDKR As String) As List(Of String)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function YearsMGR(kodeJurMGR As String) As List(Of String)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    ' ==== TENAGA PENDIDIKAN ====
    Private Function YearsTTP2(kodeJurTTP2 As String) As List(Of String)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function GetKpiTTP2(kodeJurKPITTP2 As String, yearListKPITTP2 As List(Of String)) As Dictionary(Of String, Integer)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function YearsTDP2(kodeJurTDP2 As String) As List(Of String)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function GetKpiTDP2(kodeJurKPITDP2 As String, yearListKPITDP2 As List(Of String)) As Dictionary(Of String, Integer)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function YearsDIP2(kodeJurDIP2 As String) As List(Of String)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function GetKpiDIP2(kodeJurKPIDIP2 As String, yearListKPIDIP2 As List(Of String)) As Dictionary(Of String, Integer)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function YearsSRJ2(kodeJurSRJ2 As String) As List(Of String)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function GetKpiSRJ2(kodeJurKPISRJ2 As String, yearListKPISRJ2 As List(Of String)) As Dictionary(Of String, Integer)
        ' TULISKAN CODE UNTUK FUNCTION INI
        Next

        Return thresholdsSRJ2
        dtlistsdr.clear()
    End Function

    Private Function YearsMGR2(kodeJurMGR2 As String) As List(Of String)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function GetKpiMGR2(kodeJurKPIMGR2 As String, yearListKPIMGR2 As List(Of String)) As Dictionary(Of String, Integer)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function YearsDKR2(kodeJurDKR2 As String) As List(Of String)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function GetKpiDKR2(kodeJurKPIDKR2 As String, yearListKPIDKR2 As List(Of String)) As Dictionary(Of String, Integer)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    ' ==== MHS BID KERJA ====
    Private Function YearsSSI(kodeJurSSI As String) As List(Of String)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function GetKpiSSI(kodeJurKPISSI As String, yearListKPISSI As List(Of String)) As Dictionary(Of String, Integer)
        ' TULISKAN CODE UNTUK FUNCTION INISI
        dtlistsdr.clear()
    End Function

    Private Function YearsTSI(kodeJurTSI As String) As List(Of String)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function GetKpiTSI(kodeJurKPITSI As String, yearListKPITSI As List(Of String)) As Dictionary(Of String, Integer)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function Years_6(kodeJur_6 As String) As List(Of String)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function GetKpi_6(kodeJurKPI_6 As String, yearListKPI_6 As List(Of String)) As Dictionary(Of String, Integer)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    ' ==== MHS IPK LULUSAN ====
    Private Function YearsIAV(kodeJurIAV As String) As List(Of String)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function GetKpiIAV(kodeJurKPIIAV As String, yearListKPIIAV As List(Of String)) As Dictionary(Of String, Integer)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function YearsIMX(kodeJurIMX As String) As List(Of String)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function GetKpiIMX(kodeJurKPIIMX As String, yearListKPIIMX As List(Of String)) As Dictionary(Of String, Integer)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function YearsIMN(kodeJurIMN As String) As List(Of String)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function GetKpiIMN(kodeJurKPIIMN As String, yearListKPIIMN As List(Of String)) As Dictionary(Of String, Integer)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function Years_62(kodeJur_62 As String) As List(Of String)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function GetKpi_62(kodeJurKPI_62 As String, yearListKPI_62 As List(Of String)) As Dictionary(Of String, Integer)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function YearsLOK(kodeJurLOK As String) As List(Of String)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function GetKpiLOK(kodeJurKPILOK As String, yearListKPILOK As List(Of String)) As Dictionary(Of String, Integer)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function YearsMUL(kodeJurMUL As String) As List(Of String)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function GetKpiMUL(kodeJurKPIMUL As String, yearListKPIMUL As List(Of String)) As Dictionary(Of String, Integer)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function YearsNAS(kodeJurNAS As String) As List(Of String)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function GetKpiNAS(kodeJurKPINAS As String, yearListKPINAS As List(Of String)) As Dictionary(Of String, Integer)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function Years_63(kodeJur_63 As String) As List(Of String)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function GetKpi_63(kodeJurKPI_63 As String, yearListKPI_63 As List(Of String)) As Dictionary(Of String, Integer)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    ' =========== MHS WT LULUS ==========
    Private Function YearsT06(kodeJurT06 As String) As List(Of String)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function GetKpiT06(kodeJurKPIT06 As String, yearListKPIT06 As List(Of String)) As Dictionary(Of String, Integer)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function YearsT18(kodeJurT18 As String) As List(Of String)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function GetKpiT18(kodeJurKPIT18 As String, yearListKPIT18 As List(Of String)) As Dictionary(Of String, Integer)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function YearsL18(kodeJurL18 As String) As List(Of String)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function GetKpiL18(kodeJurKPIL18 As String, yearListKPIL18 As List(Of String)) As Dictionary(Of String, Integer)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function Years_64(kodeJur_64 As String) As List(Of String)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function GetKpi_64(kodeJurKPI_64 As String, yearListKPI_64 As List(Of String)) As Dictionary(Of String, Integer)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    ' =========== MHS LULUSAN TEPAT WAKTU ==========
    Private Function YearsJDT(kodeJurJDT As String) As List(Of String)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function GetKpiJDT(kodeJurKPIJDT As String, yearListKPIJDT As List(Of String)) As Dictionary(Of String, Integer)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function YearsJLL(kodeJurJLL As String) As List(Of String)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function GetKpiJLL(kodeJurKPIJLL As String, yearListKPIJLL As List(Of String)) As Dictionary(Of String, Integer)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    'MHS
    Private Function YearsCLN(kodeJurCLN As String) As List(Of String)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function GetKpiCLN(kodeJurKPICLN As String, yearListKPICLN As List(Of String)) As Dictionary(Of String, Integer)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function YearsLLS(kodeJurLLS As String) As List(Of String)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function GetKpiLLS(kodeJurKPILLS As String, yearListKPILLS As List(Of String)) As Dictionary(Of String, Integer)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function YearsREG_1(kodeJurREG_1 As String) As List(Of String)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function GetKpiREG_1(kodeJurKPIREG_1 As String, yearListKPIREG_1 As List(Of String)) As Dictionary(Of String, Integer)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function YearsTRF_1(kodeJurTRF_1 As String) As List(Of String)
        Dim yearListTRF_1 As New List(Of String)
        qry= "SELECT DISTINCT LEFT(th_akdk, 4) AS year FROM t_target_detail " &
            "WHERE kode_jur = '" & kodeJurTRF_1 & "' AND kpi_id = 1 AND kode_elemen_dt = 'TRF'"
        
        isidatasdr(qry, "yearResultTRF_1")
        For Each row As DataRow In dtlistSdr.Rows
            If Not IsDBNull(row("year")) Then
                yearListTRF_1.Add(row("year").ToString())
            End If
        Next
        tutupsdr()

        Return yearListTRF_1
        dtlistsdr.clear()
    End Function

    Private Function GetKpiTRF_1(kodeJurKPITRF_1 As String, yearListKPITRF_1 As List(Of String)) As Dictionary(Of String, Integer)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function YearsREG_2(kodeJurREG_2 As String) As List(Of String)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function GetKpiREG_2(kodeJurKPIREG_2 As String, yearListKPIREG_2 As List(Of String)) As Dictionary(Of String, Integer)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function YearsTRF_2(kodeJurTRF_2 As String) As List(Of String)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

    Private Function GetKpiTRF_2(kodeJurKPITRF_2 As String, yearListKPITRF_2 As List(Of String)) As Dictionary(Of String, Integer)
        ' TULISKAN CODE UNTUK FUNCTION INI
    End Function

  sub btnlgout_click(obj as object, e as eventargs)
      response.redirect("logout.aspx")
  end sub

  Sub dropdowndata()
      dropjenisnya.Items.Clear() 
      dropjenisnya.Items.Add(New System.Web.UI.WebControls.ListItem("Dosen","1"))
      dropjenisnya.Items.Add(New System.Web.UI.WebControls.ListItem("Tenaga Kependidikan", "2"))

      dropjenisnya.Items.Add(New System.Web.UI.WebControls.ListItem("Mahasiswa", "3"))
      dropjenisnya.Items.Add(New System.Web.UI.WebControls.ListItem("IPK Lulusan", "4"))
      dropjenisnya.Items.Add(New System.Web.UI.WebControls.ListItem("Kelulusan Tepat Waktu", "5"))
      dropjenisnya.Items.Add(New System.Web.UI.WebControls.ListItem("Waktu Tunggu Lulusan", "6"))
      dropjenisnya.Items.Add(New System.Web.UI.WebControls.ListItem("Bidang Kerja Lulusan", "7"))
      dropjenisnya.Items.Add(New System.Web.UI.WebControls.ListItem("Jangkauan Kerja Lulusan", "8"))
  End Sub

  Sub dropjenisnya_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles dropjenisnya.SelectedIndexChanged
    If dropjenisnya.SelectedValue = "1" Then
        pnlchartdsn.Visible = true

        pnlcharttp.Visible = false
        pnlchartbid.Visible = false
        pnlchartipklls.Visible = false
        pnlchartjgk.Visible = false
        pnlchartwt.Visible = false
        pnlchartllstpt.Visible = false
        pnlchartmhs.Visible = false
        lbljudulchart.text = dropjenisnya.SelectedItem.Text
        lbljudulkpi.text = "KPI " & dropjenisnya.SelectedItem.Text
        isi_grafik_dsn()
    ElseIf dropjenisnya.SelectedValue = "2" Then
        pnlcharttp.Visible = true

        pnlchartdsn.Visible = false
        pnlchartbid.Visible = false
        pnlchartipklls.Visible = false
        pnlchartjgk.Visible = false
        pnlchartwt.Visible = false
        pnlchartllstpt.Visible = false
        pnlchartmhs.Visible = false
        lbljudulchart.text = dropjenisnya.SelectedItem.Text
        lbljudulkpi.text = "KPI " & dropjenisnya.SelectedItem.Text
        isi_grafik_tp()
    ElseIf dropjenisnya.SelectedValue = "3" Then
        pnlchartmhs.visible = true

        pnlchartdsn.Visible = false
        pnlcharttp.Visible = false
        pnlchartbid.Visible = false
        pnlchartipklls.Visible = false
        pnlchartjgk.Visible = false
        pnlchartwt.Visible = false
        pnlchartllstpt.Visible = false
        lbljudulchart.text = dropjenisnya.SelectedItem.Text
        lbljudulkpi.text = "KPI " & dropjenisnya.SelectedItem.Text
        isi_grafik_mhs()
    ElseIf dropjenisnya.SelectedValue = "4" Then
        pnlchartipklls.Visible = true

        pnlchartdsn.Visible = false
        pnlcharttp.Visible = false
        pnlchartbid.Visible = false
        pnlchartjgk.Visible = false
        pnlchartwt.Visible = false
        pnlchartllstpt.Visible = false
        pnlchartmhs.Visible = false
        lbljudulchart.text = dropjenisnya.SelectedItem.Text
        lbljudulkpi.text = "KPI " & dropjenisnya.SelectedItem.Text
        isi_grafik_ipklls()
    ElseIf dropjenisnya.SelectedValue = "5" Then
        pnlchartllstpt.visible = true

        pnlchartdsn.Visible = false
        pnlcharttp.Visible = false
        pnlchartbid.Visible = false
        pnlchartipklls.Visible = false
        pnlchartjgk.Visible = false
        pnlchartwt.Visible = false
        pnlchartmhs.Visible = false
        lbljudulchart.text = dropjenisnya.SelectedItem.Text
        lbljudulkpi.text = "KPI " & dropjenisnya.SelectedItem.Text
        isi_grafik_llstpt()
    ElseIf dropjenisnya.SelectedValue = "6" Then
        pnlchartwt.visible = true

        pnlchartdsn.Visible = false
        pnlcharttp.Visible = false
        pnlchartbid.Visible = false
        pnlchartipklls.Visible = false
        pnlchartjgk.Visible = false
        pnlchartllstpt.Visible = false
        pnlchartmhs.Visible = false
        lbljudulchart.text = dropjenisnya.SelectedItem.Text
        lbljudulkpi.text = "KPI " & dropjenisnya.SelectedItem.Text
        isi_grafik_wt()
    ElseIf dropjenisnya.SelectedValue = "7" Then
        pnlchartbid.Visible = true

        pnlchartdsn.Visible = false
        pnlcharttp.Visible = false
        pnlchartipklls.Visible = false
        pnlchartjgk.Visible = false
        pnlchartwt.Visible = false
        pnlchartllstpt.Visible = false
        pnlchartmhs.Visible = false
        lbljudulchart.text = dropjenisnya.SelectedItem.Text
        lbljudulkpi.text = "KPI " & dropjenisnya.SelectedItem.Text
        isi_grafik_bid()
    ElseIf dropjenisnya.SelectedValue = "8" Then
        pnlchartjgk.Visible = true

        pnlchartbid.Visible = false
        pnlchartdsn.Visible = false
        pnlcharttp.Visible = false
        pnlchartipklls.Visible = false
        pnlchartwt.Visible = false
        pnlchartllstpt.Visible = false
        pnlchartmhs.Visible = false
        lbljudulchart.text = dropjenisnya.SelectedItem.Text
        lbljudulkpi.text = "KPI " & dropjenisnya.SelectedItem.Text
        isi_grafik_jangkauan()
    ' Else
    '     pnlchartdsn.Visible = false
    End If
    isi_grafik()
    isi_isi()
  End Sub

  sub isi_isi()
    qry = "SELECT a.nik, a.nidn, a.kdstatus, " & _
            "a.kdpend, a.kdjja, a.kdunitkerja, " & _
            "b.kode_jur " & _
            "FROM t_pegawai a JOIN  " & _
            "t_jurus_jdw b ON " & _
            "a.kdunitkerja = b.kdunitkerja " & _
            "WHERE a.nik = '" & session("idlintar") & "'"
    isidatasdr(qry, "rscekProdi")
    If dtlistsdr.Rows.Count = 0 Then
        session("kodejurnim") = ""
        tutupsdr()
        Return 
    End If
    tutupsdr()


    qry = "select * from tjurus3 " & _ 
        "where kode_jur = '" & dtlistsdr.Rows(0)("kode_jur") & "'"
    isidatadec3(qry, "rsceknamaProdi")
    tutupdec()

    If dtlistdec3.Rows.Count > 0 Then
        If Not IsDBNull(dtlistdec3.Rows(0)("nama_jur")) Then
            nmProdi.text = dtlistdec3.Rows(0)("nama_jur").ToString() 
        Else
            nmProdi.text = String.Empty
        End If
    Else
        nmProdi.text = String.Empty
    End If

    session("kodejurnim") = dtlistdec3.Rows(0)("kode_jurnim") 
    session("kodejuraja") = dtlistdec3.Rows(0)("kode_jur") 

    If dtlistdec3.Rows.Count > 0 Then
      qry = "SELECT DISTINCT COUNT(DISTINCT k.kd_dosen) " & _
        "FROM tmaster_kontribusi k " & _
        ' TULISKAN CODE UNTUK SISANYA
      isidatasdr2(qry, "isisii")
      tutupsdr()

      If dtlistsdr2.Rows.Count > 0 Then
          ' TULISKAN CODE UNTUK SISANYA
      Else
          lblinfo.text = String.Empty
      End If
      dtlistSdr2.clear()

      qry = "select count(nik) " & _
        ' TULISKAN CODE UNTUK SISANYA
      isidatasdr2(qry, "isikry")
      tutupsdr()

      If dtlistsdr2.Rows.Count > 0 Then
          If Not IsDBNull(dtlistsdr2.Rows(0)(0)) Then
              lblinfo2.text = dtlistsdr2.Rows(0)(0).ToString() 
          Else
              lblinfo2.text = String.Empty
          End If
      Else
          lblinfo2.text = String.Empty
      End If
      dtlistSdr2.clear()

      qry = "SELECT SUM(jml_reg) AS total_jml_reg,  " & _
        ' TULISKAN CODE UNTUK SISANYA
      isidatadec(qry, "isimhsbaru")
      tutupdec()

      If dtlistdec.Rows.Count > 0 Then
          If Not IsDBNull(dtlistdec.Rows(0)(0)) Then
              lblinfo3.Text = "Reguler: " & dtlistdec.Rows(0)(0).ToString()
          Else
              lblinfo3.Text = String.Empty
          End If

          If Not IsDBNull(dtlistdec.Rows(0)(1)) Then
              lbltrf.Text = "Transfer: " & dtlistdec.Rows(0)(1).ToString()
          Else
              lbltrf.Text = String.Empty
          End If
      Else
          lblinfo3.Text = String.Empty
          lbltrf.Text = String.Empty
      End If
      dtlistdec.clear()

      qry = "SELECT SUM(jml_reg) AS total_jml_reg,  " & _
        ' TULISKAN CODE UNTUK SISANYA
      isidatadec(qry, "isimhsakf")
      tutupdec()

      If dtlistdec.Rows.Count > 0 Then
          If Not IsDBNull(dtlistdec.Rows(0)(0)) Then
              lblinfo4.Text = "Reguler: " & dtlistdec.Rows(0)(0).ToString()
          Else
              lblinfo4.Text = String.Empty
          End If

          If Not IsDBNull(dtlistdec.Rows(0)(1)) Then
              lbltrf2.Text = "Transfer: " & dtlistdec.Rows(0)(1).ToString()
          Else
              lbltrf2.Text = String.Empty
          End If
      Else
          lblinfo4.Text = String.Empty
          lbltrf2.Text = String.Empty
      End If
      dtlistdec.clear()

      ' qry = "SELECT min(th_akdk) as tahunawal,  " & _
      '   "max(th_akdk) as tahunakhir " & _
      '   "FROM tmaster_mhsakt  " & _
      '   "WHERE kode_jur = '" & dtlistdec3.Rows(0)("kode_jurnim") & "' "

      qry = "SELECT MAX(LEFT(e.th_akdk, 4)) AS th_akdk_max, " & _
        ' TULISKAN CODE UNTUK SISANYA
      isidatadec(qry, "isimhsakftahun")
      tutupdec()
      ' response.write(qry)

      If dtlistdec.Rows.Count > 0 Then
          If Not IsDBNull(dtlistdec.Rows(0)(1)) Then
              tahunawal.Text = dtlistdec.Rows(0)(1).ToString()
          Else
              tahunawal.Text = String.Empty
          End If

          If Not IsDBNull(dtlistdec.Rows(0)(0)) Then
              tahunakhir.Text = dtlistdec.Rows(0)(0).ToString()
          Else
              tahunakhir.Text = String.Empty
          End If
      Else
          tahunawal.Text = String.Empty
          tahunakhir.Text = String.Empty
      End If
      dtlistdec.clear()

      qry = "select distinct min(a.th_akdk) as mint,  " & _
        ' TULISKAN CODE UNTUK SISANYA
      isidatadec(qry, "isimhsakfwtahun")
      tutupdec()

      If dtlistdec.Rows.Count > 0 Then
          If Not IsDBNull(dtlistdec.Rows(0)(0)) Then
              awal_lulus_aktif.Text = dtlistdec.Rows(0)(0).ToString()
          Else
              awal_lulus_aktif.Text = String.Empty
          End If

          If Not IsDBNull(dtlistdec.Rows(0)(1)) Then
              akhir_lulus_aktif.Text = dtlistdec.Rows(0)(1).ToString()
          Else
              akhir_lulus_aktif.Text = String.Empty
          End If
      Else
          awal_lulus_aktif.Text = String.Empty
          akhir_lulus_aktif.Text = String.Empty
      End If
      dtlistdec.clear()

      qry = "select distinct min(a.th_akdk) as mint,  " & _
        ' TULISKAN CODE UNTUK SISANYA
      isidatadec(qry, "isimhsakfwdf")
      tutupdec()

      If dtlistdec.Rows.Count > 0 Then
          If Not IsDBNull(dtlistdec.Rows(0)(0)) Then
              awal_lulus_baru.Text = dtlistdec.Rows(0)(0).ToString()
          Else
              awal_lulus_baru.Text = String.Empty
          End If

          If Not IsDBNull(dtlistdec.Rows(0)(1)) Then
              akhir_lulus_baru.Text = dtlistdec.Rows(0)(1).ToString()
          Else
              akhir_lulus_baru.Text = String.Empty
          End If
      Else
          awal_lulus_baru.Text = String.Empty
          akhir_lulus_baru.Text = String.Empty
      End If
      dtlistdec.clear()

      qry = "SELECT SUM(jml_lulus) as lulus,  " & _
        ' TULISKAN CODE UNTUK SISANYA
      isidatadec(qry, "isimhlls")
      tutupdec()

      If dtlistdec.Rows.Count > 0 Then
          If Not IsDBNull(dtlistdec.Rows(0)(0)) Then
              lblinfolulus.Text = "Lulus: " & dtlistdec.Rows(0)(0).ToString()
          Else
              lblinfolulus.Text = String.Empty
          End If

          If Not IsDBNull(dtlistdec.Rows(0)(1)) Then
              lbllacak.Text = "Terlacak: " & dtlistdec.Rows(0)(1).ToString()
          Else
              lbllacak.Text = String.Empty
          End If
      Else
          lblinfolulus.Text = String.Empty
          lbllacak.Text = String.Empty
      End If
      dtlistdec.clear()

      qry = "SELECT ROUND(AVG(rata2_studi), 1) AS rata_rata_studi " & _
          ' TULISKAN CODE UNTUK SISANYA
      isidatadec(qry, "isirata")
      tutupdec()

      If dtlistdec.Rows.Count > 0 Then
          If Not IsDBNull(dtlistdec.Rows(0)(0)) Then
              lblrata.Text = "Rata-Rata Masa Studi: " & dtlistdec.Rows(0)(0).ToString() & " Tahun"
          Else
              lblrata.Text = String.Empty
          End If
      Else
          lblrata.Text = String.Empty
      End If
      dtlistdec.clear()

    End if
  end sub

  sub isi_grafik()
    qry = "SELECT " & _
      ' TULISKAN CODE UNTUK SISANYA
    isidatadec(qry, "isigrafik")
    tutupdec()

    If dtlistdec.Rows.Count <> 0 Then
        If Not IsDBNull(dtlistdec.Rows(0)(0)) Then
            Dim aktif As String = dtlistdec.Rows(0)(0).ToString()
            jmlmhsaktif.Text = aktif
        Else
            jmlmhsaktif.Text = ""
        End If
    Else
        jmlmhsaktif.Text = ""
    End If
    dtlistdec.clear()

    qry = "SELECT " & _
      ' TULISKAN CODE UNTUK SISANYA
    isidatadec(qry, "isigrafikbaru")
    tutupdec()

    If dtlistdec.Rows.Count <> 0 Then
        If Not IsDBNull(dtlistdec.Rows(0)(0)) Then
            Dim baru As String = dtlistdec.Rows(0)(0).ToString()
            jmlmhsbaru.Text = baru
        Else
            jmlmhsbaru.Text = ""
        End If
    Else
        jmlmhsbaru.Text = ""
    End If
    dtlistdec.clear()

    qry = "SELECT SUM(jml_lulus) +  " & _
      ' TULISKAN CODE UNTUK SISANYA
    isidatadec(qry, "isimhlls2")
    tutupdec()

      If dtlistdec.Rows.Count > 0 Then
        If Not IsDBNull(dtlistdec.Rows(0)(0)) Then
            jmlmhslulus.text = dtlistdec.Rows(0)(0).ToString() 
        Else
            jmlmhslulus.text = String.Empty
        End If
    Else
        jmlmhslulus.text = String.Empty
    End If
    dtlistdec.clear()

    qry = "SELECT DISTINCT COUNT(DISTINCT k.kd_dosen) " & _
      ' TULISKAN CODE UNTUK SISANYA
    isidatasdr2(qry, "isisiidosen")
    tutupsdr()

    If dtlistsdr2.Rows.Count > 0 Then
        If Not IsDBNull(dtlistsdr2.Rows(0)(0)) Then
            jmldosen.text = dtlistsdr2.Rows(0)(0).ToString() 
        Else
            jmldosen.text = String.Empty
        End If
    Else
        jmldosen.text = String.Empty
    End If
    dtlistSdr2.clear()
  end sub

  sub isi_grafik_dsn()
      
      ' qry = "select * from t_target_detail
      '     where kpi_id = 4"
      ' isidatasdr2(qry, "isikpi")
      ' tutupsdr()

      qry = "SELECT a.nik, a.nidn, a.kdstatus, " & _
              ' TULISKAN CODE UNTUK SISANYA
      isidatasdr(qry, "rscekProdi2222we")
      If dtlistsdr.Rows.Count = 0 Then
          session("kodejurnim") = ""
          tutupsdr()
          Return 
      End If
      tutupsdr()


      qry = "select * from tjurus3 " & _ 
          "where kode_jur = '" & dtlistsdr.Rows(0)("kode_jur") & "'"
      isidatadec3(qry, "rsceknamaProd222iwe")
      tutupdec()

      session("kodejurnim") = dtlistdec3.Rows(0)("kode_jurnim") 
      
      ' UNTUK JUMLAH DOSEN AKTIF YANG MENGAJAR
      qry = "select left(th_akdk, 4) as th_akdk, sum(jml) as jml, kode_jur " & _
          ' TULISKAN CODE UNTUK SISANYA
      isidatasdr(qry, "isit_master_jmldosen_jadwal")
      tutupsdr()
      ' debug.text = qry


      ' UNTUK JUMLAH DOSEN AKTIF YANG MENGAJAR
      If dtlistsdr.Rows.Count > 0 Then
          Dim TSjmldose_jadwal As New Dictionary(Of Integer, Integer)

          ' Isi dictionary TSjmldose_jadwal dengan data dari dtlistsdr
          For Each row As DataRow In dtlistsdr.Rows
              Dim key As Integer = CInt(row("th_akdk"))
              Dim value As Integer = CInt(row("jml"))

              If TSjmldose_jadwal.ContainsKey(key) Then
                  ' Jika kunci sudah ada, perbarui nilainya (atau tentukan logika lain)
                  TSjmldose_jadwal(key) = value
              Else
                  TSjmldose_jadwal.Add(key, value)
              End If
          Next

          ' Ambil semua kunci dari dictionary
          Dim commonjadwal As New List(Of Integer)(TSjmldose_jadwal.Keys.ToList())

          If commonjadwal.Count <> 0 Then
              jmldosenjdw = "["
              tahunjadwal = "["

              ' Loop melalui kunci dan buat string
              For Each tsJadwal In commonjadwal
                  jmldosenjdw += TSjmldose_jadwal(tsJadwal).ToString() & "," 
                  tahunjadwal += "'" & CStr(tsJadwal) & "',"
              Next

              ' Hapus koma terakhir dan tambahkan tanda tutup
              tahunjadwal = tahunjadwal.TrimEnd(","c) & "]"
              jmldosenjdw = jmldosenjdw.TrimEnd(","c) & "]"
          End If
      End If
      dtlistsdr.clear()

      ' UNTUK GELAR DOSEN
      qry = "select left(th_akdk, 4) as th_akdk, sum(jml) as jml_gelarp6, kode_jur " & _
          ' TULISKAN CODE UNTUK SISANYA
      isidatasdr3(qry, "isigelargrafik")
      tutupsdr()
      ' debug.text = qry

      If Not dtlistsdr3.Columns.Contains("jml_gelarp7") Then
          dtlistsdr3.Columns.Add("jml_gelarp7", GetType(Integer))
      End If

      For j = 0 To dtlistsdr3.Rows.Count - 1
          ' UNTUK JUMLAH GELAR P7
          qry = "select left(th_akdk, 4) as th_akdk, sum(jml) as jml_gelarp7dosen, kode_jur " & _
              ' TULISKAN CODE UNTUK SISANYA
          isidatasdr2(qry, "isigelargrafikp7")
          tutupsdr()
          ' debug.text = qry

          If dtlistsdr2 IsNot Nothing AndAlso dtlistsdr2.Rows.Count > 0 Then
              Dim row = dtlistsdr2.Rows(0)

              ' Cek apakah nilai jml_gelarp7dosen bisa dikonversi ke Integer
              Dim gelarp7Value As Integer
              If Integer.TryParse(row("jml_gelarp7dosen").ToString(), gelarp7Value) Then
                  dtlistsdr3.Rows(j)("jml_gelarp7") = gelarp7Value
              Else
                  dtlistsdr3.Rows(j)("jml_gelarp7") = 0
              End If
          Else
              ' Jika tidak ada hasil, beri nilai default (misalnya 0)
              dtlistsdr3.Rows(j)("jml_gelarp7") = 0
          End If
      Next

      ' UNTUK GELAR DOSEN
      If dtlistsdr3.Rows.Count > 0 Then
          Dim TSP6 As New Dictionary(Of Integer, Integer)
          Dim TSP7 As New Dictionary(Of Integer, Integer)
          If dtlistsdr3.Rows.Count <> 0 Then
              For Each row As DataRow In dtlistsdr3.Rows
                  Dim key As Integer = CInt(row("th_akdk"))
                  Dim valueP6 As Integer = CInt(row("jml_gelarp6"))
                  Dim valueP7 As Integer = CInt(row("jml_gelarp7"))

                  If TSP6.ContainsKey(key) Then
                      ' Jika kunci sudah ada, perbarui nilainya (atau tentukan logika lain)
                      TSP6(key) = valueP6
                  Else
                      TSP6.Add(key, valueP6)
                  End If

                  If TSP7.ContainsKey(key) Then
                      ' Jika kunci sudah ada, perbarui nilainya (atau tentukan logika lain)
                      TSP7(key) = valueP7
                  Else
                      TSP7.Add(key, valueP7)
                  End If
              Next
          End If
          Dim commongelar As New List(Of Integer)(TSP6.Keys.Intersect(TSP7.Keys).ToList())
          If commongelar.Count <> 0 Then
              gelarp6 = "["
              gelarp7 = "["
              tahungelar = "["

              For Each tsStaus In commongelar
                  gelarp6 += TSP6(tsStaus).ToString() & "," 
                  gelarp7 += TSP7(tsStaus).ToString() & "," 
                  tahungelar += "'" & CStr(tsStaus) & "',"
              Next

              tahungelar = tahungelar.TrimEnd(","c) & "]"
              gelarp6 = gelarp6.TrimEnd(","c) & "]"
              gelarp7 = gelarp7.TrimEnd(","c) & "]"
          End If
      End If
      dtlistsdr3.clear()

      ' UNTUK JUMLAH DOSEN TETAP
      qry = "select left(th_akdk, 4) as th_akdk, sum(jml) as tetap from t_master_jmldsn_sts " & _
          ' TULISKAN CODE UNTUK SISANYA
      isidatasdr2(qry, "isit_master_jmldsn_stsTETAP")
      tutupsdr()

      If Not dtlistsdr2.Columns.Contains("tdaktetap") Then
          dtlistsdr2.Columns.Add("tdaktetap", GetType(Integer))
      End If

      For i = 0 To dtlistsdr2.Rows.Count - 1
          ' UNTUK JUMLAH DOSEN TIDAK TETAP
          qry = "select left(th_akdk, 4) as th_akdk, sum(jml) as tdktetap from t_master_jmldsn_sts " & _
          ' TULISKAN CODE UNTUK SISANYA
          isidatasdr3(qry, "isit_master_jmldsn_ststdkTETAP")
          tutupsdr()

          If dtlistsdr3 IsNot Nothing AndAlso dtlistsdr3.Rows.Count > 0 Then
              Dim row = dtlistsdr3.Rows(0)

              ' Cek apakah nilai tdktetap bisa dikonversi ke Integer
              Dim tdktetapValue As Integer
              If Integer.TryParse(row("tdktetap").ToString(), tdktetapValue) Then
                  dtlistsdr2.Rows(i)("tdaktetap") = tdktetapValue
              Else
                  ' Jika nilai tidak bisa dikonversi, beri nilai default (misalnya 0)
                  dtlistsdr2.Rows(i)("tdaktetap") = 0
              End If
          Else
              ' Jika tidak ada hasil, beri nilai default (misalnya 0)
              dtlistsdr2.Rows(i)("tdaktetap") = 0
          End If
      Next

      ' UNTUK STS DOSEN
      If dtlistsdr2.Rows.Count > 0 Then
          Dim TStetap As New Dictionary(Of Integer, Integer)
          Dim TStidak As New Dictionary(Of Integer, Integer)
          If dtlistsdr2.Rows.Count <> 0 Then
              For Each row As DataRow In dtlistsdr2.Rows
                  Dim key As Integer = CInt(row("th_akdk"))
                  Dim valueTetap As Integer = CInt(row("tetap"))
                  Dim valueTdktetap As Integer = CInt(row("tdaktetap"))

                  If TStetap.ContainsKey(key) Then
                      ' Jika kunci sudah ada, perbarui nilainya (atau tentukan logika lain)
                      TStetap(key) = valueTetap
                  Else
                      TStetap.Add(key, valueTetap)
                  End If

                  If TStidak.ContainsKey(key) Then
                      ' Jika kunci sudah ada, perbarui nilainya (atau tentukan logika lain)
                      TStidak(key) = valueTdktetap
                  Else
                      TStidak.Add(key, valueTdktetap)
                  End If
              Next
          End If
          Dim commonstatus As New List(Of Integer)(TStetap.Keys.Intersect(TStidak.Keys).ToList())
          If commonstatus.Count <> 0 Then
              statustetap = "["
              statustdktetap = "["
              tahunstatus = "["

              For Each tsStaus In commonstatus
                  statustetap += TStetap(tsStaus).ToString() & "," 
                  statustdktetap += TStidak(tsStaus).ToString() & "," 
                  tahunstatus += "'" & CStr(tsStaus) & "',"
              Next

              tahunstatus = tahunstatus.TrimEnd(","c) & "]"
              statustetap = statustetap.TrimEnd(","c) & "]"
              statustdktetap = statustdktetap.TrimEnd(","c) & "]"
          End If
      End If
      dtlistsdr2.clear()

      qry = "SELECT kd_dosen," & _
          ' TULISKAN CODE UNTUK SISANYA
      isidatasdr2(qry, "bimbinganisi")
      tutupsdr()

      ' UNTUK bimbingan DOSEN
      If dtlistsdr2.Rows.Count > 0 Then
          Dim TSsendiri As New Dictionary(Of Integer, Integer)
          Dim TSlain As New Dictionary(Of Integer, Integer)
          If dtlistsdr2.Rows.Count <> 0 Then
              For Each row As DataRow In dtlistsdr2.Rows
                  Dim key As Integer = CInt(row("tahun"))
                  Dim valuesendiri As Integer = CInt(row("jumlah_bimbingan_pssendiri"))
                  Dim valuelain As Integer = CInt(row("jumlah_bimbingan_pslain"))

                  If TSsendiri.ContainsKey(key) Then
                      ' Jika kunci sudah ada, perbarui nilainya (atau tentukan logika lain)
                      TSsendiri(key) = valuesendiri
                  Else
                      TSsendiri.Add(key, valuesendiri)
                  End If

                  If TSlain.ContainsKey(key) Then
                      ' Jika kunci sudah ada, perbarui nilainya (atau tentukan logika lain)
                      TSlain(key) = valuelain
                  Else
                      TSlain.Add(key, valuelain)
                  End If
              Next
          End If
          Dim commonbim As New List(Of Integer)(TSsendiri.Keys.Intersect(TSlain.Keys).ToList())
          If commonbim.Count <> 0 Then
              pssendiribim = "["
              pslainbim = "["
              tahunbimbinganbim = "["

              For Each tsbim In commonbim
                  pssendiribim += TSsendiri(tsbim).ToString() & "," 
                  pslainbim += TSlain(tsbim).ToString() & "," 
                  tahunbimbinganbim += "'" & CStr(tsbim) & "',"
              Next

              tahunbimbinganbim = tahunbimbinganbim.TrimEnd(","c) & "]"
              pssendiribim = pssendiribim.TrimEnd(","c) & "]"
              pslainbim = pslainbim.TrimEnd(","c) & "]"
          End If
      End If
      dtlistsdr2.clear()

      pnlchartdsn.visible = true
      ' dtlistsdr.clear()
      ' dtlistsdr2.clear()
      ' dtlistsdr3.clear()
  end sub

  sub isi_grafik_tp()
    qry = "SELECT a.nik, a.nidn, a.kdstatus, " & _
            "a.kdpend, a.kdjja, a.kdunitkerja, " & _
            "b.kode_jur " & _
            "FROM t_pegawai a JOIN  " & _
            "t_jurus_jdw b ON " & _
            "a.kdunitkerja = b.kdunitkerja " & _
            "WHERE a.nik = '" & session("idlintar") & "'"
    isidatasdr(qry, "rscekProdigr")
    If dtlistsdr.Rows.Count = 0 Then
        tutupsdr()
        Return 
    End If
    tutupsdr()

    qry = "select * from tjurus3 " & _ 
        "where kode_jur = '" & dtlistsdr.Rows(0)("kode_jur") & "'"
    isidatadec3(qry, "rsceknamaProdigr")
    tutupdec()
    ' debug.text = qry
    session("kodedivisi") = dtlistdec3.Rows(0)("kode_div")
    
    ' UNTUK JUMLAH TETAP
      qry = "select count(a.nik) as jumlah_kryttp,  " & _
        ' TULISKAN CODE UNTUK SISANYA
    isidatasdr(qry, "isitetap")
    tutupsdr()

    If Not dtlistsdr.Columns.Contains("jml_tidak") Then
        dtlistsdr.Columns.Add("jml_tidak", GetType(Integer))
    End If

    qry = "SELECT th_akf, kdunitkerja, " & _
        ' TULISKAN CODE UNTUK SISANYA
    isidatasdr3(qry, "isipend")
    tutupsdr()

    For j = 0 To dtlistsdr.Rows.Count - 1
        ' UNTUK JUMLAH tidak ttp
        qry = "select count(a.nik) as jumlah_krytidak,  " & _
            ' TULISKAN CODE UNTUK SISANYA
        isidatasdr2(qry, "isigelargrafikp7")
        tutupsdr()
        ' debug.text = qry

        If dtlistsdr2 IsNot Nothing AndAlso dtlistsdr2.Rows.Count > 0 Then
            Dim row = dtlistsdr2.Rows(0)

            Dim statustidakttp As Integer
            If Integer.TryParse(row("jumlah_krytidak").ToString(), statustidakttp) Then
                dtlistsdr.Rows(j)("jml_tidak") = statustidakttp
            Else
                dtlistsdr.Rows(j)("jml_tidak") = 0
            End If
        Else
            ' Jika tidak ada hasil, beri nilai default (misalnya 0)
            dtlistsdr.Rows(j)("jml_tidak") = 0
        End If
    Next

    If dtlistsdr3.Rows.Count > 0 Then
        Dim magister As New Dictionary(Of Integer, Integer)
        Dim diploma As New Dictionary(Of Integer, Integer)
        Dim doktor As New Dictionary(Of Integer, Integer)
        Dim sarjana As New Dictionary(Of Integer, Integer)

        ' Loop through each row in the result
        For Each row As DataRow In dtlistsdr3.Rows
            Dim key As Integer = CInt(row("th_akf"))
            
            ' Get values for each category and add them to respective dictionaries
            If Not IsDBNull(row("jmlmg")) Then
                magister(key) = CInt(row("jmlmg"))
            End If
            If Not IsDBNull(row("jmldip")) Then
                diploma(key) = CInt(row("jmldip"))
            End If
            If Not IsDBNull(row("jmldk")) Then
                doktor(key) = CInt(row("jmldk"))
            End If
            If Not IsDBNull(row("jmlsr")) Then
                sarjana(key) = CInt(row("jmlsr"))
            End If
        Next

        ' Find common keys for each dictionary
        Dim commonKeys As New List(Of Integer)(magister.Keys.Union(diploma.Keys).Union(doktor.Keys).Union(sarjana.Keys))

        ' Prepare the output strings
        strMagister = "["
        strDiploma = "["
        strDoktor = "["
        strSarjana = "["
        unitkerja = "["

        ' Loop through common keys and build strings
        For Each key In commonKeys
            strMagister += If(magister.ContainsKey(key), magister(key).ToString(), "0") & ","
            strDiploma += If(diploma.ContainsKey(key), diploma(key).ToString(), "0") & ","
            strDoktor += If(doktor.ContainsKey(key), doktor(key).ToString(), "0") & ","
            strSarjana += If(sarjana.ContainsKey(key), sarjana(key).ToString(), "0") & ","
            unitkerja += "'" & key.ToString() & "',"
        Next

        ' Remove trailing commas and close brackets
        strMagister = strMagister.TrimEnd(","c) & "]"
        strDiploma = strDiploma.TrimEnd(","c) & "]"
        strDoktor = strDoktor.TrimEnd(","c) & "]"
        strSarjana = strSarjana.TrimEnd(","c) & "]"
        unitkerja = unitkerja.TrimEnd(","c) & "]"
    End If

    ' UNTUK status Pegawai
    If dtlistsdr.Rows.Count > 0 Then
        Dim tstetapkry As New Dictionary(Of Integer, Integer)
        Dim tstidakttpkry As New Dictionary(Of Integer, Integer)
        If dtlistsdr.Rows.Count <> 0 Then
            For Each row As DataRow In dtlistsdr.Rows
                Dim key As Integer = CInt(row("th_akf"))
                Dim valuettp As Integer = CInt(row("jumlah_kryttp"))
                Dim valuetidak As Integer = CInt(row("jml_tidak"))

                If tstetapkry.ContainsKey(key) Then
                    ' Jika kunci sudah ada, perbarui nilainya (atau tentukan logika lain)
                    tstetapkry(key) = valuettp
                Else
                    tstetapkry.Add(key, valuettp)
                End If

                If tstidakttpkry.ContainsKey(key) Then
                    ' Jika kunci sudah ada, perbarui nilainya (atau tentukan logika lain)
                    tstidakttpkry(key) = valuetidak
                Else
                    tstidakttpkry.Add(key, valuetidak)
                End If
            Next
        End If
        Dim commonstskry As New List(Of Integer)(tstetapkry.Keys.Intersect(tstidakttpkry.Keys).ToList())
        If commonstskry.Count <> 0 Then
            jml_tetap = "["
            jml_tidak = "["
            unitkerja = "["

            For Each tsStaus In commonstskry
                jml_tetap += tstetapkry(tsStaus).ToString() & "," 
                jml_tidak += tstidakttpkry(tsStaus).ToString() & "," 
                unitkerja += "'" & CStr(tsStaus) & "',"
            Next

            unitkerja = unitkerja.TrimEnd(","c) & "]"
            jml_tetap = jml_tetap.TrimEnd(","c) & "]"
            jml_tidak = jml_tidak.TrimEnd(","c) & "]"
        End If
    End If
    dtlistsdr.clear()
  end sub

  sub isi_grafik_bid()
    qry = "SELECT a.nik, a.nidn, a.kdstatus, " & _
            "a.kdpend, a.kdjja, a.kdunitkerja, " & _
            "b.kode_jur " & _
            "FROM t_pegawai a JOIN  " & _
            "t_jurus_jdw b ON " & _
            "a.kdunitkerja = b.kdunitkerja " & _
            "WHERE a.nik = '" & session("idlintar") & "'"
    isidatasdr(qry, "rscekProdi2222w12e")
    If dtlistsdr.Rows.Count = 0 Then
        session("kodejurnim") = ""
        tutupsdr()
        Return 
    End If
    tutupsdr()


    qry = "select * from tjurus3 " & _ 
        "where kode_jur = '" & dtlistsdr.Rows(0)("kode_jur") & "'"
    isidatadec3(qry, "rsceknamaProd222iw12e")
    tutupdec()

    qry = "SELECT * " & _
        ' TULISKAN CODE UNTUK SISANYA
    isidatadec(qry, "rscek")
    tutupdec()

    ' === ISI GRAFIK lulusan ===

    ' lulusan 
    Dim lulusan As New Dictionary(Of Integer, integer)
    Dim lacak As New Dictionary(Of Integer, integer)

    If dtlistdec.Rows.Count <> 0 Then
        For Each row As DataRow In dtlistdec.Rows
            lulusan.Add(CInt(row("tahun_lulus")), CInt(row("jml_lulus")))
            lacak.Add(CInt(row("tahun_lulus")), CInt(row("jml_lulus_terlacak")))
        Next 
    End If

    'Gabungkan hasil
    Dim commonlulusan As New List(Of Integer)(lulusan.Keys.
        Intersect(lacak.Keys).
        ToList())

    If commonlulusan.Count <> 0 Then
        jml_lulus = "["
        jml_lacak = "["
        tahun_lulusan = "["

        For Each tslulus In commonlulusan
            jml_lulus += lulusan(tslulus).ToString() & "," 
            jml_lacak += lacak(tslulus).ToString() & "," 
            tahun_lulusan += "'" & CStr(tslulus) & "',"
        Next

        tahun_lulusan = tahun_lulusan.TrimEnd(","c) & "]"
        jml_lulus = jml_lulus.TrimEnd(","c) & "]"
        jml_lacak = jml_lacak.TrimEnd(","c) & "]"
    End If

    ' === ISI GRAFIK bidang ===

    ' wt 
    Dim v_sesuaibidang As New Dictionary(Of Integer, integer)
    Dim v_tidaksesuai As New Dictionary(Of Integer, integer)

    If dtlistdec.Rows.Count <> 0 Then
        For Each row As DataRow In dtlistdec.Rows
            v_sesuaibidang.Add(CInt(row("tahun_lulus")), CInt(row("sesuai")))
            v_tidaksesuai.Add(CInt(row("tahun_lulus")), CInt(row("tdksesuai")))
        Next 
    End If

    'Gabungkan hasil
    Dim commonbidang As New List(Of Integer)(v_sesuaibidang.Keys.
        Intersect(v_tidaksesuai.Keys).ToList())

    If commonbidang.Count <> 0 Then
        jml_sesuai = "["
        jml_tidak2 = "["
        tahun_lulusan = "["

        For Each tsbid In commonbidang
            jml_sesuai += v_sesuaibidang(tsbid).ToString() & "," 
            jml_tidak2 += v_tidaksesuai(tsbid).ToString() & "," 
            tahun_lulusan += "'" & CStr(tsbid) & "',"
        Next

        tahun_lulusan = tahun_lulusan.TrimEnd(","c) & "]"
        jml_sesuai = jml_sesuai.TrimEnd(","c) & "]"
        jml_tidak2 = jml_tidak2.TrimEnd(","c) & "]"
    End If


    dtlistdec.Clear()
  end sub

  sub isi_grafik_ipklls()
    qry = "SELECT a.nik, a.nidn, a.kdstatus, " & _
            "a.kdpend, a.kdjja, a.kdunitkerja, " & _
            "b.kode_jur " & _
            "FROM t_pegawai a JOIN  " & _
            "t_jurus_jdw b ON " & _
            "a.kdunitkerja = b.kdunitkerja " & _
            "WHERE a.nik = '" & session("idlintar") & "'"
    isidatasdr(qry, "rscekipklls")
    If dtlistsdr.Rows.Count = 0 Then
        session("kodejurnim") = ""
        tutupsdr()
        Return 
    End If
    tutupsdr()


    qry = "select * from tjurus3 " & _ 
        "where kode_jur = '" & dtlistsdr.Rows(0)("kode_jur") & "'"
    isidatadec3(qry, "rsceknamaipklls")
    tutupdec()

    qry = "SELECT * " & _
        ' TULISKAN CODE UNTUK SISANYA
    isidatadec(qry, "rscekipklls")
    tutupdec()

    ' === ISI GRAFIK IPK ===

    ' IPK 
    Dim ipkmin As New Dictionary(Of Integer, Decimal)
    Dim ipkmax As New Dictionary(Of Integer, Decimal)
    Dim ipkavg As New Dictionary(Of Integer, Decimal)

    If dtlistdec.Rows.Count <> 0 Then
        For Each row As DataRow In dtlistdec.Rows
            ipkmin.Add(CInt(row("tahun_lulus")), CDec(row("ipk_min")))
            ipkmax.Add(CInt(row("tahun_lulus")), CDec(row("ipk_max")))
            ipkavg.Add(CInt(row("tahun_lulus")), CDec(row("ipk_avg")))
        Next 
    End If

    'Gabungkan hasil
    Dim commonipk As New List(Of Integer)(ipkmin.Keys.
        Intersect(ipkmax.Keys).
        Intersect(ipkavg.Keys).ToList())

    If commonipk.Count <> 0 Then
        ipk_min = "["
        ipk_max = "["
        ipk_avg = "["
        tahun_IPK = "["

        For Each tsipk In commonipk
            ipk_min += ipkmin(tsipk).ToString("F2") & "," 
            ipk_max += ipkmax(tsipk).ToString("F2") & "," 
            ipk_avg += ipkavg(tsipk).ToString("F2") & ","
            tahun_IPK += "'" & CStr(tsipk) & "',"
        Next

        tahun_IPK = tahun_IPK.TrimEnd(","c) & "]"
        ipk_min = ipk_min.TrimEnd(","c) & "]"
        ipk_max = ipk_max.TrimEnd(","c) & "]"
        ipk_avg = ipk_avg.TrimEnd(","c) & "]"
    End If

    ' === ISI GRAFIK JML LULUS ===
    Dim jml_lulusan As New Dictionary(Of Integer, Integer)

    If dtlistdec.Rows.Count <> 0 Then
        For Each row As DataRow In dtlistdec.Rows
            ' Menambahkan tahun_lulus dan jml_lulus ke dalam dictionary
            jml_lulusan.Add(CInt(row("tahun_lulus")), CInt(row("jml_lulus")))
        Next 
    End If

    ' Gabungkan hasil untuk jml_lulus
    Dim commonLulus As New List(Of Integer)(jml_lulusan.Keys)

    If commonLulus.Count <> 0 Then
        jml_lulus2 = "["
        tahun_Lulus = "["

        For Each tahun In commonLulus
            jml_lulus2 += jml_lulusan(tahun).ToString() & ","
            tahun_Lulus += "'" & CStr(tahun) & "',"
        Next

        tahun_Lulus = tahun_Lulus.TrimEnd(","c) & "]"
        jml_lulus2 = jml_lulus2.TrimEnd(","c) & "]"
    End If

    dtlistdec.Clear()
  end sub

    sub isi_grafik_wt()
        qry = "SELECT a.nik, a.nidn, a.kdstatus, " & _
                "a.kdpend, a.kdjja, a.kdunitkerja, " & _
                "b.kode_jur " & _
                "FROM t_pegawai a JOIN  " & _
                "t_jurus_jdw b ON " & _
                "a.kdunitkerja = b.kdunitkerja " & _
                "WHERE a.nik = '" & session("idlintar") & "'"
        isidatasdr(qry, "rscekProdi2222w12e")
        If dtlistsdr.Rows.Count = 0 Then
            session("kodejurnim") = ""
            tutupsdr()
            Return 
        End If
        tutupsdr()


        qry = "select * from tjurus3 " & _ 
            "where kode_jur = '" & dtlistsdr.Rows(0)("kode_jur") & "'"
        isidatadec3(qry, "rsceknamaProd222iw12e")
        tutupdec()

        qry = "SELECT * " & _
            ' TULISKAN CODE UNTUK SISANYA
        isidatadec(qry, "rscek")
        tutupdec()

        ' === ISI GRAFIK lulusan ===

        ' lulusan 
        Dim lulusan As New Dictionary(Of Integer, integer)
        Dim lacak As New Dictionary(Of Integer, integer)

        If dtlistdec.Rows.Count <> 0 Then
            For Each row As DataRow In dtlistdec.Rows
                lulusan.Add(CInt(row("tahun_lulus")), CInt(row("jml_lulus")))
                lacak.Add(CInt(row("tahun_lulus")), CInt(row("jml_lulus_terlacak")))
            Next 
        End If

        'Gabungkan hasil
        Dim commonlulusan As New List(Of Integer)(lulusan.Keys.
            Intersect(lacak.Keys).
            ToList())

        If commonlulusan.Count <> 0 Then
            jml_lulus4 = "["
            jml_lacak4 = "["
            tahun_lulusan4 = "["

            For Each tslulus In commonlulusan
                jml_lulus4 += lulusan(tslulus).ToString() & "," 
                jml_lacak4 += lacak(tslulus).ToString() & "," 
                tahun_lulusan4 += "'" & CStr(tslulus) & "',"
            Next

            tahun_lulusan4 = tahun_lulusan4.TrimEnd(","c) & "]"
            jml_lulus4 = jml_lulus4.TrimEnd(","c) & "]"
            jml_lacak4 = jml_lacak4.TrimEnd(","c) & "]"
        End If

        ' === ISI GRAFIK wt ===

        ' wt 
        Dim v_6bln As New Dictionary(Of Integer, Decimal)
        Dim v_618bln As New Dictionary(Of Integer, Decimal)
        Dim v_18bln As New Dictionary(Of Integer, Decimal)

        If dtlistdec.Rows.Count <> 0 Then
            For Each row As DataRow In dtlistdec.Rows
                v_6bln.Add(CInt(row("tahun_lulus")), CDec(row("wt_6bln")))
                v_618bln.Add(CInt(row("tahun_lulus")), CDec(row("wt_6_18bln")))
                v_18bln.Add(CInt(row("tahun_lulus")), CDec(row("wt_18bln")))
            Next 
        End If

        'Gabungkan hasil
        Dim commonwt As New List(Of Integer)(v_6bln.Keys.
            Intersect(v_618bln.Keys).
            Intersect(v_18bln.Keys).ToList())

        If commonwt.Count <> 0 Then
            jml_6bln = "["
            jml618bln = "["
            jml_18bln = "["
            tahun_lulusan4 = "["

            For Each tswt In commonwt
                jml_6bln += v_6bln(tswt).ToString("F2") & "," 
                jml618bln += v_618bln(tswt).ToString("F2") & "," 
                jml_18bln += v_18bln(tswt).ToString("F2") & ","
                tahun_lulusan4 += "'" & CStr(tswt) & "',"
            Next

            tahun_lulusan4 = tahun_lulusan4.TrimEnd(","c) & "]"
            jml_6bln = jml_6bln.TrimEnd(","c) & "]"
            jml618bln = jml618bln.TrimEnd(","c) & "]"
            jml_18bln = jml_18bln.TrimEnd(","c) & "]"
        End If


        dtlistdec.Clear()
    end sub

    sub isi_grafik_mhs()
        qry = "SELECT a.nik, a.nidn, a.kdstatus, " & _
                "a.kdpend, a.kdjja, a.kdunitkerja, " & _
                "b.kode_jur " & _
                "FROM t_pegawai a JOIN  " & _
                "t_jurus_jdw b ON " & _
                "a.kdunitkerja = b.kdunitkerja " & _
                "WHERE a.nik = '" & session("idlintar") & "'"
        isidatasdr(qry, "rscekP21e")
        If dtlistsdr.Rows.Count = 0 Then
            session("kodejurnim") = ""
            tutupsdr()
            Return 
        End If
        tutupsdr()


        qry = "select * from tjurus3 " & _ 
            "where kode_jur = '" & dtlistsdr.Rows(0)("kode_jur") & "'"
        isidatadec3(qry, "rsce23e")
        tutupdec()

        qry = "SELECT * " & _
            ' TULISKAN CODE UNTUK SISANYA
        isidatadec(qry, "rsce3k")
        tutupdec()
        ' ===== ISI GRAFIK ====

        ' CALON
        Dim TScalonPen As New Dictionary(Of Integer, Integer)
        Dim TScalonLulus As New Dictionary(Of Integer, Integer)

        ' MAHASISWA BARU
        Dim TSnewReg As New Dictionary(Of Integer, Integer)
        Dim TSnewTrf As New Dictionary(Of Integer, Integer)

        ' MAHASISWA AKTIF
        Dim TSaktReg As New Dictionary(Of Integer, Integer)
        Dim TSaktTrf As New Dictionary(Of Integer, Integer)


        If dtlistdec.Rows.Count <> 0 Then
            For Each row As DataRow In dtlistdec.Rows
                'CALON
                TScalonPen.Add(CInt(row("th_akdk")), CInt(row("jml_pdf"))) 
                TScalonLulus.Add(CInt(row("th_akdk")), CInt(row("jml_lls"))) 
            Next
        End If

        qry = "SELECT * " & _
           ' TULISKAN CODE UNTUK SISANYA
        isidatadec2(qry, "rsce32k")
        tutupdec()

        If dtlistdec2.Rows.Count <> 0 Then
            For Each row As DataRow In dtlistdec2.Rows
                'MAHASISWA BARU
                TSnewReg.Add(CInt(row("th_akdk")), CInt(row("jml_reg"))) 
                TSnewTrf.Add(CInt(row("th_akdk")), CInt(row("jml_trf"))) 
            Next
        End If

        qry = "SELECT * " & _
            ' TULISKAN CODE UNTUK SISANYA
        isidatadec3(qry, "rsce323k")
        tutupdec()

        If dtlistdec3.Rows.Count <> 0 Then
            For Each row As DataRow In dtlistdec3.Rows
                'MAHASISWA AKTIF
                TSaktReg.Add(CInt(row("th_akdk")), CInt(row("jml_reg"))) 
                TSaktTrf.Add(CInt(row("th_akdk")), CInt(row("jml_trf"))) 
            Next
        End If

        ' Gabungkan hasil
        ' CALON
        Dim commoncalon As New List(Of Integer)(TScalonPen.Keys.Intersect(TScalonLulus.Keys).ToList())

        ' MAHASISWA BARU
        Dim commonnew As New List(Of Integer)(TSnewReg.Keys.Intersect(TSnewTrf.Keys).ToList())

        ' MAHASISWA AKTIF
        Dim commonaktif As New List(Of Integer)(TSaktReg.Keys.Intersect(TSaktTrf.Keys).ToList())

        ' CALON
        If commoncalon.Count <> 0 Then
            calonpen_mhs = "["
            calonlulus_mhs = "["
            tahuncalon = "["

            For Each tscalon In commoncalon
                calonpen_mhs += TScalonPen(tscalon).ToString() & "," 
                calonlulus_mhs += TScalonLulus(tscalon).ToString() & "," 
                tahuncalon += "'" & CStr(tscalon) & "',"
            Next

            tahuncalon = tahuncalon.TrimEnd(","c) & "]"
            calonpen_mhs = calonpen_mhs.TrimEnd(","c) & "]"
            calonlulus_mhs = calonlulus_mhs.TrimEnd(","c) & "]"
        End If

        'MAHASISWA BARU
        If commonnew.Count <> 0 Then
            newreg_mhs = "["
            newtrf_mhs = "["
            tahunnew = "["

            For Each tsnew In commonnew
                newreg_mhs += TSnewReg(tsnew).ToString() & "," 
                newtrf_mhs += TSnewTrf(tsnew).ToString() & "," 
                tahunnew += "'" & CStr(tsnew) & "',"
            Next

            tahunnew = tahunnew.TrimEnd(","c) & "]"
            newreg_mhs = newreg_mhs.TrimEnd(","c) & "]"
            newtrf_mhs = newtrf_mhs.TrimEnd(","c) & "]"
        End If

        'MAHASISWA AKTIF
        If commonaktif.Count <> 0 Then
            aktifreg_mhs = "["
            aktiftrf_mhs = "["
            tahunaktif = "["

            For Each tsaktif In commonaktif
                aktifreg_mhs += TSaktReg(tsaktif).ToString() & "," 
                aktiftrf_mhs += TSaktTrf(tsaktif).ToString() & "," 
                tahunaktif += "'" & CStr(tsaktif) & "',"
            Next

            tahunaktif = tahunaktif.TrimEnd(","c) & "]"
            aktifreg_mhs = aktifreg_mhs.TrimEnd(","c) & "]"
            aktiftrf_mhs = aktiftrf_mhs.TrimEnd(","c) & "]"
        End If
        dtlistdec.clear()
        dtlistdec2.clear()
        dtlistdec3.clear()
    end sub

    sub isi_grafik_jangkauan()
        qry = "SELECT a.nik, a.nidn, a.kdstatus, " & _
                "a.kdpend, a.kdjja, a.kdunitkerja, " & _
                "b.kode_jur " & _
                "FROM t_pegawai a JOIN  " & _
                "t_jurus_jdw b ON " & _
                "a.kdunitkerja = b.kdunitkerja " & _
                "WHERE a.nik = '" & session("idlintar") & "'"
        isidatasdr(qry, "rscekProdi2222w12e")
        If dtlistsdr.Rows.Count = 0 Then
            session("kodejurnim") = ""
            tutupsdr()
            Return 
        End If
        tutupsdr()


        qry = "select * from tjurus3 " & _ 
            "where kode_jur = '" & dtlistsdr.Rows(0)("kode_jur") & "'"
        isidatadec3(qry, "rsceknamaProd222iw12e")
        tutupdec()

        qry = "SELECT * " & _
            ' TULISKAN CODE UNTUK SISANYA
        isidatadec(qry, "rscek")
        tutupdec()

        ' === ISI GRAFIK lulusan ===

        ' lulusan 
        Dim lulusan As New Dictionary(Of Integer, integer)
        Dim lacak As New Dictionary(Of Integer, integer)

        If dtlistdec.Rows.Count <> 0 Then
            For Each row As DataRow In dtlistdec.Rows
                lulusan.Add(CInt(row("tahun_lulus")), CInt(row("jml_lulus")))
                lacak.Add(CInt(row("tahun_lulus")), CInt(row("jml_lulus_terlacak")))
            Next 
        End If

        'Gabungkan hasil
        Dim commonlulusan As New List(Of Integer)(lulusan.Keys.
            Intersect(lacak.Keys).
            ToList())

        If commonlulusan.Count <> 0 Then
            jml_lulus3 = "["
            jml_lacak3 = "["
            tahun_lulusan3 = "["

            For Each tslulus In commonlulusan
                jml_lulus3 += lulusan(tslulus).ToString() & "," 
                jml_lacak3 += lacak(tslulus).ToString() & "," 
                tahun_lulusan3 += "'" & CStr(tslulus) & "',"
            Next

            tahun_lulusan3 = tahun_lulusan3.TrimEnd(","c) & "]"
            jml_lulus3 = jml_lulus3.TrimEnd(","c) & "]"
            jml_lacak3 = jml_lacak3.TrimEnd(","c) & "]"
        End If

        ' === ISI GRAFIK jangkauan ===

        ' jangkauan 
        Dim v_bidlokal As New Dictionary(Of Integer, integer)
        Dim v_bidnasional As New Dictionary(Of Integer, integer)
        Dim v_bidmulti As New Dictionary(Of Integer, integer)

        If dtlistdec.Rows.Count <> 0 Then
            For Each row As DataRow In dtlistdec.Rows
                v_bidlokal.Add(CInt(row("tahun_lulus")), CInt(row("lokal")))
                v_bidnasional.Add(CInt(row("tahun_lulus")), CInt(row("nasional")))
                v_bidmulti.Add(CInt(row("tahun_lulus")), CInt(row("multinasional")))
            Next 
        End If

        'Gabungkan hasil
        Dim commonbid As New List(Of Integer)(v_bidlokal.Keys.
            Intersect(v_bidnasional.Keys).
            Intersect(v_bidmulti.Keys).ToList())

        If commonbid.Count <> 0 Then
            t_lokal = "["
            t_nasional = "["
            t_multi = "["
            tahun_lulusan3 = "["

            For Each tsbid In commonbid
                t_lokal += v_bidlokal(tsbid).ToString() & "," 
                t_nasional += v_bidnasional(tsbid).ToString() & ","  
                t_multi += v_bidmulti(tsbid).ToString() & ","
                tahun_lulusan3 += "'" & CStr(tsbid) & "',"
            Next

            tahun_lulusan3 = tahun_lulusan3.TrimEnd(","c) & "]"
            t_lokal = t_lokal.TrimEnd(","c) & "]"
            t_nasional = t_nasional.TrimEnd(","c) & "]"
            t_multi = t_multi.TrimEnd(","c) & "]"
        End If


        dtlistdec.Clear()
    end sub

    sub isi_grafik_llstpt()
        qry = "SELECT a.nik, a.nidn, a.kdstatus, " & _
                "a.kdpend, a.kdjja, a.kdunitkerja, " & _
                "b.kode_jur " & _
                "FROM t_pegawai a JOIN  " & _
                "t_jurus_jdw b ON " & _
                "a.kdunitkerja = b.kdunitkerja " & _
                "WHERE a.nik = '" & session("idlintar") & "'"
        isidatasdr(qry, "rscekP5e")
        If dtlistsdr.Rows.Count = 0 Then
            session("kodejurnim") = ""
            tutupsdr()
            Return 
        End If
        tutupsdr()


        qry = "select * from tjurus3 " & _ 
            "where kode_jur = '" & dtlistsdr.Rows(0)("kode_jur") & "'"
        isidatadec3(qry, "rsceknama5")
        tutupdec()

        qry = "SELECT * " & _
            ' TULISKAN CODE UNTUK SISANYA
        isidatadec(qry, "rscek5")
        tutupdec()
        ' Response.write(qry)

        ' === ISI GRAFIK bidang ===

        Dim v_jmlditerima As New Dictionary(Of Integer, integer)
        Dim v_jmllulus As New Dictionary(Of Integer, integer)

        If dtlistdec.Rows.Count <> 0 Then
            For Each row As DataRow In dtlistdec.Rows
                v_jmlditerima.Add(CInt(row("th_angkatan")), CInt(row("jumlah_diterima")))
                v_jmllulus.Add(CInt(row("th_angkatan")), CInt(row("jumlah_lulus")))
            Next 
        End If

        'Gabungkan hasil
        Dim commontpt As New List(Of Integer)(v_jmlditerima.Keys.
            Intersect(v_jmllulus.Keys).ToList())

        If commontpt.Count <> 0 Then
            jml_terima = "["
            jml_lulus5 = "["
            tahun_ang = "["

            For Each tstpt In commontpt
                jml_terima += v_jmlditerima(tstpt).ToString() & "," 
                jml_lulus5 += v_jmllulus(tstpt).ToString() & "," 
                tahun_ang += "'" & CStr(tstpt) & "',"
            Next

            tahun_ang = tahun_ang.TrimEnd(","c) & "]"
            jml_terima = jml_terima.TrimEnd(","c) & "]"
            jml_lulus5 = jml_lulus5.TrimEnd(","c) & "]"
        End If


        dtlistdec.Clear()
    end sub

</script>
<form runat="server">

<style>
  body{
    font-size:14px;	
  }
  .label2 {
    font-size: 2.5rem; 
    font-weight: bold; 
    margin: 0;        
  }

  .small-label {
    font-size: 2.5rem; ; 
    margin: 0;        
  }

  /* Styling for the specific row of info boxes */
  .row.custom-info-boxes {
      margin: 0 auto;
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
  }

  /* Styling for each specific info-box */
  .row.custom-info-boxes .info-box {
      margin-bottom: 20px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
  }

  /* Info box icon styling for specific info boxes */
  .row.custom-info-boxes .info-box-icon {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 60px;
      width: 60px;
      font-size: 30px;
      color: #fff;
      margin : 10px 0 0 10px;
      border-radius: 50%;
  }

  /* Info box content styling for specific info boxes */
  .row.custom-info-boxes .info-box-content {
      padding: 10px;
  }

  .row.custom-info-boxes .info-box-text {
      font-size: 14px;
      font-weight: bold;
      color: #555;
  }

  .row.custom-info-boxes .info-box-number {
      font-size: 20px;
      font-weight: bold;
      color: #333;
  }

  /* Specific styling for asp:Label elements inside the info boxes */
  .row.custom-info-boxes asp\:label {
      font-size: 16px; /* Adjust font size as needed */
      font-weight: normal;
      color: #333;
  }

  /* Responsive styling for smaller screens within this specific layout */
  @media (max-width: 768px) {
      .row.custom-info-boxes .col-md-3, 
      .row.custom-info-boxes .col-sm-6, 
      .row.custom-info-boxes .col-xs-12 {
          width: 100%;
          margin-bottom: 20px;
      }
  }

  /* Optional: Hover effect on the info-box to make it interactive */
  .row.custom-info-boxes .info-box:hover {
      background-color: #f1f1f1;
      box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
  }

  .user-stat-box {
    display: flex;
    align-items: center;
    gap: 20px;
    padding: 20px;
    background: linear-gradient(135deg, #f0f4f8, #e8f5e9); /* Gradien warna lembut */
    border-radius: 12px; /* Sudut lebih membulat */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15); /* Bayangan lembut */
    border: 1px solid #d1e3dd; /* Garis tepi halus */
    transition: all 0.3s ease-in-out; /* Animasi transisi */
  }

  .user-stat-icon {
    font-size: 120px;
    color: #4caf50; /* Warna hijau lembut */
    text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Memberikan bayangan pada ikon */
  }

  .user-stat-label {
    font-size: 28px; /* Ukuran teks lebih besar */
    font-weight: 600; /* Font lebih tebal */
    color: #333; /* Warna teks */
    line-height: 1.2; /* Spasi antar baris */
    text-align: left; /* Teks rata kiri */
  }

  .user-stat-box:hover {
    background: linear-gradient(135deg, #e8f5e9, #d4efdf); /* Gradien warna saat hover */
    transform: scale(1.05); /* Memperbesar elemen sedikit */
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2); /* Bayangan lebih tegas */
    cursor: pointer; /* Menampilkan kursor pointer */
  }

  .user-stat-box:hover .user-stat-icon {
    color: #388e3c; /* Warna hijau lebih gelap saat hover */
    transform: rotate(5deg); /* Efek rotasi kecil pada ikon */
    transition: transform 0.3s ease, color 0.3s ease; /* Animasi transisi untuk ikon */
  }

  .user-stat-box:hover .user-stat-label {
    color: #1b5e20; /* Warna teks lebih gelap saat hover */
    transition: color 0.3s ease; /* Animasi transisi untuk warna teks */
  }

  .h3-style {
      font-size: 1.75rem; /* Sama dengan h3 */
      font-weight: bold;
      margin: 0; /* Opsional, sesuai kebutuhan */
  }

</style>
<asp:Panel ID="pnlPimpinan" runat="server" Visible="true" >
	<section class="content-header">
      <asp:Label ID="kecil" Text="Dashboard Portofolio Prodi" runat="server" CssClass="small-label" />
      <asp:Label ID="nmprodi" runat="server" CssClass="label2" style= "color: #000;" />
      <ol class="breadcrumb">
          <li><a href="index.aspx"><i class="fa fa-dashboard"></i> Dashboard</a></li>
      </ol>
  </section><br>
  <asp:Label ID="jmldosen" runat="server" visible = "false"></asp:Label>
  <asp:Label ID="jmlmhsaktif" runat="server" visible = "false"></asp:Label>
  <asp:Label ID="jmlmhsbaru" runat="server" visible = "false"></asp:Label>
  <asp:Label ID="jmlmhslulus" runat="server" visible = "false"></asp:Label>
  <asp:Label ID="tahunawal" runat="server" visible = "false"></asp:Label>
  <asp:Label ID="tahunakhir" runat="server" visible = "false"></asp:Label>
  <asp:Label ID="awal_lulus_aktif" runat="server" visible = "false"></asp:Label>
  <asp:Label ID="akhir_lulus_aktif" runat="server" visible = "false"></asp:Label>
  <asp:Label ID="awal_lulus_baru" runat="server" visible = "false"></asp:Label>
  <asp:Label ID="akhir_lulus_baru" runat="server" visible = "false"></asp:Label>

    <!-- Main content -->
    <div class="col-lg-12 col-xs-12" style="padding:0;"> 


      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        
    
        <!-- Main content -->
        <section class="content">

      <div class="row custom-info-boxes">
        <div class="row">
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-aqua"><i class="fa fa-user"></i></span>

                <div class="info-box-content">
                    <span class="info-box-text">Jml. Dosen</span>
                    <span class="info-box-number"><asp:label id="lblinfo" font-bold="false" text="" runat="server" /></span>
                </div>
                <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
        </div>
        <!-- /.col -->

        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-green"><i class="fa fa-user"></i></span>

                <div class="info-box-content">
                    <span class="info-box-text">Jml. Staff</span>
                    <span class="info-box-number"><asp:label id="lblinfo2" font-bold="false" text="" runat="server" /></span>
                </div>
                <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
        </div>
        <!-- /.col -->

        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-yellow"><i class="fa fa-user"></i></span>

                <div class="info-box-content">
                    <span class="info-box-text">Jml. Mhs. Baru</span>
                    <span class="info-box-number">
                      <asp:label id="lblinfo3" font-bold="false" 
                        text="" runat="server" /><br>
                      <asp:label id="lbltrf" font-bold="false" 
                        text="" runat="server" />
                    </span>
                </div>
                <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
        </div>
        <!-- /.col -->

        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-red"><i class="fa fa-user"></i></span>

                <div class="info-box-content">
                    <span class="info-box-text">Jml. Mhs. Aktif</span>
                    <span class="info-box-number">
                      <asp:label id="lblinfo4" font-bold="false" 
                        text="" runat="server" /><br>
                      <asp:label id="lbltrf2" font-bold="false" 
                        text="" runat="server" />
                    </span>
                </div>
                <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
        </div>
        <!-- /.col -->

        <!-- Menambahkan kolom ke-5 dengan ukuran 2 kolom -->
        <div class="col-md-3 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-purple"><i class="fa fa-user"></i></span>

                <div class="info-box-content">
                    <span class="info-box-text">Jml. Mhs. Lulus</span>
                    <span class="info-box-number">
                      <asp:label id="lblinfolulus" font-bold="false" 
                        text="" runat="server" /><br>
                      <asp:label id="lbllacak" font-bold="false" 
                        text="" runat="server" />
                    </span>
                </div>
                <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
        </div>
        <!-- /.col -->
    </div>
      <!-- /.row -->

      <div class="row">
        <div class="col-md-12">
          <!-- USERS LIST -->
          <div class="box box-primary" style="display: block;">
            <div class="box-header with-border">
              <h3 class="box-title"></h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="user-stat-box">
              <i class="fa fa-user-graduate user-stat-icon"></i>
              <asp:Label ID="lblrata" CssClass="user-stat-label" Font-Bold="false" Text="Test" runat="server" />
            </div>
          </div>
          <!--/.box -->
        </div>
        <!-- /.col -->
      </div>

    <asp:Panel ID="pnlratio" runat="server" Width="100%">
        <!-- USERS LIST -->
        <div class="box box-primary" style="display: block; overflow: hidden;">
            <div class="box-header with-border">
                <h3 class="box-title">Ratio</h3>
                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding" 
                style="display: flex; flex-wrap: wrap; justify-content: space-between; align-items: center; overflow: hidden; padding: 10px;">

                <!-- Chart 1 -->
                <div class="chart-container" 
                    style="flex: 1; padding: 10px; text-align: center; max-width: 33.3%; box-sizing: border-box; position: relative;">
                    <!-- Title stays in its place -->
                    <h3 class="chart-title" style="font-size: 16px; font-weight: bold; color: #333; position: absolute; top: 10px; left: 0; width: 100%; text-align: center;">
                    Ratio Jumlah Dosen & Mahasiswa Periode <%= tahunawal.Text %> - <%= tahunakhir.Text %>
                    </h3>

                    <!-- Chart container with offset for the chart -->
                    <div id="chart-dsn-mhs" style="height: 100%; width: 100%; margin-top: 40px;"></div>
                    <div id="ratio-info1" style="text-align: center; margin-top: 10px;"></div>
                </div>

                <!-- Chart 2: Ratio of Mahasiswa Lulus to Mahasiswa Aktif -->
                <div class="chart-container" 
                    style="flex: 1; padding: 10px; text-align: center; max-width: 33.3%; box-sizing: border-box; position: relative;">
                    <!-- Title stays in its place -->
                    <h3 class="chart-title" style="font-size: 16px; font-weight: bold; color: #333; position: absolute; top: 10px; left: 0; width: 100%; text-align: center;">
                        Ratio Jumlah Mhs. Lulus & Aktif Periode <%= tahunawal.Text %> - <%= tahunakhir.Text %>
                    </h3>

                    <!-- Chart container with offset for the chart -->
                    <div id="chart-lls-akf" style="height: 100%; width: 100%; margin-top: 40px;"></div>
                    <div id="ratio-info2" style="text-align: center; margin-top: 10px;"></div>
                </div>

                <!-- Chart 3: Ratio of Mahasiswa Lulus to Mahasiswa Baru -->
                <div class="chart-container" 
                    style="flex: 1; padding: 10px; text-align: center; max-width: 33.3%; box-sizing: border-box; position: relative;">
                    <!-- Title stays in its place -->
                    <h3 class="chart-title" style="font-size: 16px; font-weight: bold; color: #333; position: absolute; top: 10px; left: 0; width: 100%; text-align: center;">
                        Ratio Jumlah Mhs. Lulus & Baru Periode <%= tahunawal.Text %> - <%= tahunakhir.Text %>
                    </h3>

                    <!-- Chart container with offset for the chart -->
                    <div id="chart-lls-new" style="height: 100%; width: 100%; margin-top: 40px;"></div>
                    <div id="ratio-info3" style="text-align: center; margin-top: 10px;"></div>
                </div>

            </div>
        </div>
        <!--/.box -->
    </asp:panel>

    <!--/.PANEL UNTUK LINE CHART -->
      <asp:Panel ID="pnlkpi" runat="server" visible= false Width="100%">
        <!-- USERS LIST -->
        <div class="box box-success" style="display: block;">
          <div class="box-header with-border">
            <asp:Label ID="lbljudulkpi" CssClass="box-title h3-style" runat="server"></asp:Label>
            <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
            </div>
          </div>
          <!-- /.box-header -->
          <div class="box-body no-padding" >
            <!-- panel kpi dosen-->
            <asp:Panel ID="pnlkpidsn" runat="server" Width="95%" Visible="true" style= "margin: 18px; margin-top: 80px;">
                <asp:Repeater ID="rptdsn" runat="server" >
                    <HeaderTemplate>
                        <table style="width: 98%; margin: 15px; border-collapse: collapse; font-size: 15px; border: 1px solid #ddd;margin-top:10px;">
                            <thead>
                                <tr style="background-color: #A91D3A; color: white; text-align: center; font-weight: normal !important;">
                                    <th rowspan="2">No.</th>
                                    <th rowspan="2">Tahun Akdk</th>
                                    <th rowspan="2">Nama Dosen</th>
                                    <th colspan="2">Jumlah Bimbingan Skripsi</th>
                                    
                                </tr>
                                <tr style="background-color: #A91D3A; color: white; text-align: center; font-weight: normal !important;">
                                    <th>PS Sendiri</th>
                                    <th>PS Lain</th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    
                    <ItemTemplate>
                        <tr id="row" runat="server" style='<%# If(Container.ItemIndex Mod 2 = 0, "background-color:#ffffff;", "background-color:#eeeeee;") %>'>
                            <td class="table-cell">
                            <asp:Label ID="lblNo" runat="server" Text='<%# Container.ItemIndex + 1 %>'></asp:Label>
                        </td>
                            <td class="table-cell" style="width: 90px;">
                                <%# Eval("kd_dosen") %>
                            </td>
                            <td class="table-cell" style = "text-align: left; width: 200px;"><%# Eval("nama") %></td>
                            <td class="table-cell"><%# Eval("lain") %></td>
                            <td class="table-cell"><%# Eval("sendiri") %></td>
                        </tr>
                    </ItemTemplate>
                    
                    <FooterTemplate>
                    
                        </tbody>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </asp:panel>

            <!-- panel kpi tp-->
            <asp:Panel ID="pnlkpitp" runat="server" Width="95%" Visible="true" style= "margin: 18px; margin-top: 80px;">
                <asp:Literal ID="littp" runat="server"></asp:Literal></br>
            </asp:panel>

            <!-- panel kpi mhs bid-->
            <asp:Panel ID="pnlkpibid" runat="server" Width="95%" Visible="true" style= "margin: 18px; margin-top: 80px;">
                <asp:Literal ID="litbid" runat="server"></asp:Literal></br>
            </asp:panel>

            <!-- panel kpi mhs ipklls-->
            <asp:Panel ID="pnlkpiipklls" runat="server" Width="95%" Visible="true" style= "margin: 18px; margin-top: 80px;">
                <asp:Literal ID="litipklls" runat="server"></asp:Literal></br>
            </asp:panel>

            <!-- panel kpi mhs jgk-->
            <asp:Panel ID="pnlkpijgk" runat="server" Width="95%" Visible="true" style= "margin: 18px; margin-top: 80px;">
                <asp:Literal ID="litjgk" runat="server"></asp:Literal></br>
            </asp:panel>

            <!-- panel kpi mhs wt-->
            <asp:Panel ID="pnlkpiwt" runat="server" Width="95%" Visible="true" style= "margin: 18px; margin-top: 80px;">
                <asp:Literal ID="litwt" runat="server"></asp:Literal></br>
            </asp:panel>

            <!-- panel kpi mhs llstpt-->
            <asp:Panel ID="pnlkpillstpt" runat="server" Width="95%" Visible="true" style= "margin: 18px; margin-top: 80px;">
                <asp:Literal ID="litllstpt" runat="server"></asp:Literal></br>
            </asp:panel>

            <!-- panel kpi mhs mhs-->
            <asp:Panel ID="pnlkpimhs" runat="server" Width="95%" Visible="true" style= "margin: 18px; margin-top: 80px;">
                <asp:Literal ID="litmhs" runat="server"></asp:Literal></br>
            </asp:panel>
          </div>
        </div>
        <!--/.box -->
      </asp:Panel>

    <!--/.PANEL UNTUK LINE CHART -->
    <asp:Panel ID="pnlLs" runat="server" Width="100%">
    <!-- USERS LIST -->
    <div class="box box-success" style="display: block;">
        <div class="box-header with-border">
        <asp:Label ID="lbljudulchart" CssClass="box-title h3-style" runat="server"></asp:Label>
        <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
        </div>
        </div>
        <!-- /.box-header -->
        <div class="box-body no-padding" >
        <div class="col-md-12">
            <asp:Label ID="lblgelar" CssClass="font-weight-bold" 
                style="font-size: 14px; color: #6c757d; display: block; margin-bottom: 8px;" 
                runat="server" Text="KELOMPOK DATA">
            </asp:Label>
            <asp:DropDownList ID="dropjenisnya" 
                OnSelectedIndexChanged="dropjenisnya_SelectedIndexChanged"
                runat="server" AutoPostBack="True" 
                CssClass="form-select rounded-pill" 
                style="width: 100%; height: 38px; border: 1px solid #ced4da; box-shadow: none; font-size: 14px;">
            </asp:DropDownList>
        </div>

        <!-- panel chart dosen-->
        <asp:Panel ID="pnlchartdsn" runat="server" Width="95%" Visible="true" style= "margin: 18px; margin-top: 80px;">
            <div class="row">
                <div class="card-body">
                    <div class="position-relative mb-4">
                        <div id="jadwal-chart" height="250"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="card-body">
                    <div class="position-relative mb-4">
                        <div id="jmlsts-chart" height="250"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="card-body">
                    <div class="position-relative mb-4">
                        <div id="jmlgelar-chart" height="250"></div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="card-body">
                    <div class="position-relative mb-4">
                        <div id="jmlbim-chart" height="250"></div>
                    </div>
                </div>
            </div>
        </asp:Panel>

        <!-- panel chart tp-->
        <asp:Panel ID="pnlcharttp" runat="server" Width="95%" Visible="true" style= "margin: 20px; margin-top: 80px;">
            <div class="row">
                <div class="card-body">
                    <div class="position-relative mb-4">
                        <div id="sts-chart" height="250"></div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="card-body">
                    <div class="position-relative mb-4">
                        <div id="pend-chart" height="250"></div>
                    </div>
                </div>
            </div>
        </asp:Panel>

        <!-- panel chart MHS BID -->
        <asp:Panel ID="pnlchartbid" runat="server" Width="95%" Visible="true" style= "margin: 18px; margin-top: 80px;">
            <div class="row">
                <div class="card-body">
                    <div class="position-relative mb-4">
                        <div id="lls-chart" height="250"></div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="card-body">
                    <div class="position-relative mb-4">
                        <div id="bid-chart" height="250"></div>
                    </div>
                </div>
            </div>
        </asp:Panel>

        <!-- panel chart MHS IPK LLS -->
        <asp:Panel ID="pnlchartipklls" runat="server" Width="95%" Visible="true" style= "margin: 18px; margin-top: 80px;">
            <div class="row">
                <div class="card-body">
                    <div class="position-relative mb-4">
                        <div id="ipk-chart" height="250"></div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="card-body">
                    <div class="position-relative mb-4">
                        <div id="jml-lulus-chart" height="250"></div>
                    </div>
                </div>
            </div>
        </asp:Panel>

        <!-- panel chart MHS JANGKAUAN LLS -->
        <asp:Panel ID="pnlchartjgk" runat="server" Width="95%" Visible="true" style= "margin: 18px; margin-top: 80px;">
            <div class="row">
                <div class="card-body">
                    <div class="position-relative mb-4">
                        <div id="lls2-chart" height="250"></div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="card-body">
                    <div class="position-relative mb-4">
                        <div id="jkg-chart" height="250"></div>
                    </div>
                </div>
            </div>
        </asp:Panel>

        <!-- panel chart MHS WAKTU Tunggu LULUSAN -->
        <asp:Panel ID="pnlchartwt" runat="server" Width="95%" Visible="true" style= "margin: 18px; margin-top: 80px;">
            <div class="row">
                <div class="card-body">
                    <div class="position-relative mb-4">
                        <div id="llswt-chart" height="250"></div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="card-body">
                    <div class="position-relative mb-4">
                        <div id="wt-chart" height="250"></div>
                    </div>
                </div>
            </div>
        </asp:Panel>

        <!-- panel chart MHS LULUS TEPAT WAKTU-->
        <asp:Panel ID="pnlchartllstpt" runat="server" Width="95%" Visible="true" style= "margin: 18px; margin-top: 80px;">
            
            <div class="row">
                <div class="card-body">
                    <div class="position-relative mb-4">
                        <div id="tpt-chart" height="250"></div>
                    </div>
                </div>
            </div>
        </asp:Panel>

        <!-- panel chart MHS -->
        <asp:Panel ID="pnlchartmhs" runat="server" Width="95%" Visible="true" style= "margin: 20px; margin-top: 80px;">
            <div class="row">
                <div class="card-body">
                    <div class="position-relative mb-4">
                        <div id="calon-chart" height="250"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="card-body">
                    <div class="position-relative mb-4">
                        <div id="new-chart" height="250"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="card-body">
                    <div class="position-relative mb-4">
                        <div id="aktif-chart" height="250"></div>
                    </div>
                </div>
            </div>
        </asp:Panel>
        </div>
    </div>
    <!--/.box -->
    </asp:Panel>

      <!-- /.row -->

    <!-- /.sdm_dosen -->
    <asp:Literal ID="thresholdAKF" runat="server" visible = false ></asp:Literal>
    <asp:Literal ID="thresholdTDP" runat="server" visible = false></asp:Literal>
    <asp:Literal ID="thresholdTTP" runat="server" visible = false></asp:Literal>
    <asp:Literal ID="thresholdMGR" runat="server" visible = false></asp:Literal>
    <asp:Literal ID="thresholdDKR" runat="server" visible = false></asp:Literal>
    <asp:Literal ID="thresholdPSS" runat="server" visible = false></asp:Literal>
    <asp:Literal ID="thresholdPSL" runat="server" visible = false></asp:Literal>

    <!-- /.Tenaga pendidikan -->
    <asp:Literal ID="thresholdTDP2" runat="server" visible = false></asp:Literal>
    <asp:Literal ID="thresholdTTP2" runat="server" visible = false></asp:Literal>
    <asp:Literal ID="thresholdMGR2" runat="server" visible = false></asp:Literal>
    <asp:Literal ID="thresholdDIP2" runat="server" visible = false></asp:Literal>
    <asp:Literal ID="thresholdDKR2" runat="server" visible = false></asp:Literal>
    <asp:Literal ID="thresholdSRJ2" runat="server" visible = false></asp:Literal>

    <!-- /.MHS BID  -->
    <asp:Literal ID="thresholdSSI" runat="server" visible = false></asp:Literal>
    <asp:Literal ID="thresholdTSI" runat="server" visible = false></asp:Literal>
    <asp:Literal ID="threshold_6" runat="server" visible = false></asp:Literal>

    <!-- /.MHS IPK LLS  -->
    <asp:Literal ID="thresholdIAV" runat="server" visible = false></asp:Literal>
    <asp:Literal ID="thresholdIMN" runat="server" visible = false></asp:Literal>
    <asp:Literal ID="thresholdIMX" runat="server" visible = false></asp:Literal>

    <asp:Literal ID="threshold_62" runat="server" visible = false></asp:Literal>
      
    <!-- /.MHS JANGKAUAN LLS  -->
    <asp:Literal ID="thresholdLOK" runat="server" visible = false></asp:Literal>
    <asp:Literal ID="thresholdNAS" runat="server" visible = false></asp:Literal>
    <asp:Literal ID="thresholdMUL" runat="server" visible = false></asp:Literal>

    <asp:Literal ID="threshold_63" runat="server" visible = false></asp:Literal>

    <!-- /.MHS WT LLS  -->
    <asp:Literal ID="thresholdT06" runat="server" visible = false></asp:Literal>
    <asp:Literal ID="thresholdT18" runat="server" visible = false></asp:Literal>
    <asp:Literal ID="thresholdL18" runat="server" visible = false></asp:Literal>

    <asp:Literal ID="threshold_64" runat="server" visible = false></asp:Literal>

    <!-- /.MHS LULUSAN TEPAT WAKTU  -->
    <asp:Literal ID="thresholdJDT" runat="server" visible = false></asp:Literal>
    <asp:Literal ID="thresholdJLL" runat="server" visible = false></asp:Literal>

    <!-- /.MHS  -->
    <asp:Literal ID="thresholdCLN" runat="server" visible = false></asp:Literal>
    <asp:Literal ID="thresholdLLS" runat="server" visible = false></asp:Literal>

    <asp:Literal ID="thresholdREG_1" runat="server" visible = false></asp:Literal>
    <asp:Literal ID="thresholdTRF_1" runat="server" visible = false></asp:Literal>

    <asp:Literal ID="thresholdREG_2" runat="server" visible = false></asp:Literal>
    <asp:Literal ID="thresholdTRF_2" runat="server" visible = false></asp:Literal>
  </section>
    <!-- /.content -->
    </div>
  <!-- /.content-wrapper -->
 </div>
</section>
<!-- page script -->

</asp:Panel>       
</form>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="../../admin_lte310/plugins/chart.js/Chart.min.js"></script>
<script src="../../admin_lte310/dist/js/demo.js"></script>
<script src="../../admin_lte310/plugins/flot/jquery.flot.js"></script>
<script src="../../admin_lte310/plugins/flot/plugins/jquery.flot.pie.js"></script>
<% 
    Dim namaProdi As String = HttpUtility.JavaScriptStringEncode(nmProdi.Text)
%>
<% 
Response.Write("<script>let jmldosen = parseInt(" & jmldosen.Text & ", 10);</script>")
Response.Write("<script>let jmlmhsaktif = parseInt(" & jmlmhsaktif.Text & ", 10);</script>")

Response.Write("<script>let jmlmhslulus = parseInt(" & jmlmhslulus.Text & ", 10);</script>")

Response.Write("<script>let jmlmhsbaru = parseInt(" & jmlmhsbaru.Text & ", 10);</script>")
%>

<% 
    Dim tahunawal1 As String = HttpUtility.JavaScriptStringEncode(tahunawal.Text)
    Dim tahunakhir1 As String = HttpUtility.JavaScriptStringEncode(tahunakhir.Text)
    Dim awal_aktif As String = HttpUtility.JavaScriptStringEncode(awal_lulus_aktif.Text)
    Dim akhir_aktif As String = HttpUtility.JavaScriptStringEncode(akhir_lulus_aktif.Text)
    Dim awal_baru As String = HttpUtility.JavaScriptStringEncode(awal_lulus_baru.Text)
    Dim akhir_baru As String = HttpUtility.JavaScriptStringEncode(akhir_lulus_baru.Text)
%>

<script>
  let awal = "<%= tahunawal1 %>";
  let akhir = "<%= tahunakhir1 %>";

  // Chart 1: Ratio of Dosen to Mahasiswa Aktif
  let dosenValue = Math.max(jmldosen, 1);
  let mahasiswaAktifValue = jmlmhsaktif;
  let ratioDosenMhsAktif = `1:${(mahasiswaAktifValue / dosenValue).toFixed(0)}`;

  var options1 = {
    series: [dosenValue, mahasiswaAktifValue],
    chart: {
      width: 500,
      height: 300,
      type: 'donut',
    },
    plotOptions: {
      pie: {
        startAngle: -90,
        endAngle: 270,
        donut: {
          size: '65%',
          labels: {
            show: true,
            total: { 
              show: true,
              label: ratioDosenMhsAktif,
              color: '#333',
              fontSize: '20px',
              fontWeight: 600
            }
          }
        },
      }
    },
    dataLabels: {
      enabled: false
    },
    fill: {
      type: 'gradient',
    },
    legend: {
      show: true,
      position: 'bottom',
      horizontalAlign: 'center',
      formatter: function(val, opts) {
        return val + " - " + opts.w.globals.series[opts.seriesIndex];
      },
      offsetX: -50, // Geser legend ke kiri
    },
    colors: ['#FF4560', '#008FFB'],
    labels: ['Dosen', 'Mahasiswa Aktif'],
    responsive: [{
      breakpoint: 480,
      options: {
        chart: {
          width: 300,
          height: 200,
        },
        legend: {
          offsetX: -20 // Geser legend sedikit pada perangkat kecil
        }
      }
    }]
  };

  var chart1 = new ApexCharts(document.querySelector("#chart-dsn-mhs"), options1);
  chart1.render();

  // Geser hanya grafiknya
  document.querySelector("#chart-dsn-mhs .apexcharts-canvas").style.marginLeft = "-50px";  // Geser grafik ke kiri

  // Menurunkan grafik ke bawah
  document.querySelector("#chart-dsn-mhs .apexcharts-canvas").style.marginTop = "60px";  // Geser grafik ke bawah


  // Chart 2: Ratio of Mahasiswa Lulus to Mahasiswa Aktif
  let mhsLulusValue = Math.max(jmlmhslulus, 1);
  let ratioMhsLulusMhsAktif = `1:${(mahasiswaAktifValue / mhsLulusValue).toFixed(0)}`;

  var options2 = {
    series: [mhsLulusValue, mahasiswaAktifValue],
    chart: {
      width: 500,
      height: 300,
      type: 'donut',
    },
    plotOptions: {
      pie: {
        startAngle: -90,
        endAngle: 270,
        donut: {
          size: '65%',
          labels: {
            show: true,
            total: { // Ini yang menampilkan nilai perbandingan
              show: true,
              label: ratioMhsLulusMhsAktif,
              color: '#333',
              fontSize: '20px',
              fontWeight: 600
            }
          }
        }
      }
    },
    dataLabels: {
      enabled: false
    },
    fill: {
      type: 'gradient',
    },
    legend: {
      show: true,
      position: 'bottom',
      horizontalAlign: 'center',
      formatter: function(val, opts) {
        return val + " - " + opts.w.globals.series[opts.seriesIndex];
      },
      offsetX: -50, // Geser legend ke kiri
    },
    colors: ['#F09319', '#608BC1'],
    labels: ['Mahasiswa Lulus', 'Mahasiswa Aktif'],
    responsive: [{
      breakpoint: 480,
      options: {
        chart: {
          width: 300,
          height: 200
        },
        legend: {
          offsetX: -20
        }
      }
    }]
  };

  var chart2 = new ApexCharts(document.querySelector("#chart-lls-akf"), options2);
  chart2.render();

   // Geser hanya grafiknya
  document.querySelector("#chart-lls-akf .apexcharts-canvas").style.marginLeft = "-50px";  // Geser grafik ke kiri

  // Menurunkan grafik ke bawah
  document.querySelector("#chart-lls-akf .apexcharts-canvas").style.marginTop = "60px";  // Geser grafik ke bawah


  // Chart 3: Ratio of Mahasiswa Lulus to Mahasiswa Baru
  let mhsBaruValue = jmlmhsbaru;
  let ratioMhsLulusMhsBaru = `1:${(mhsBaruValue / mhsLulusValue).toFixed(0)}`;

  var options3 = {
    series: [mhsLulusValue, mhsBaruValue],
    chart: {
      width: 500,
      height: 300,
      type: 'donut',
    },
    plotOptions: {
      pie: {
        startAngle: -90,
        endAngle: 270,
        donut: {
          size: '65%',
          labels: {
            show: true,
            total: { // Ini yang menampilkan nilai perbandingan
              show: true,
              label: ratioMhsLulusMhsBaru, 
              color: '#333',
              fontSize: '20px',
              fontWeight: 600
            }
          }
        }
      }
    },
    dataLabels: {
      enabled: false
    },
    fill: {
      type: 'gradient',
    },
    legend: {
      show: true,
      position: 'bottom',
      horizontalAlign: 'center',
      formatter: function(val, opts) {
        return val + " - " + opts.w.globals.series[opts.seriesIndex];
      },
      offsetX: -50, // Geser legend ke kiri
    },
    colors: ['#3B1E54', '#37AFE1'],
    labels: ['Mahasiswa Lulus', 'Mahasiswa Baru'],
    responsive: [{
      breakpoint: 480,
      options: {
        chart: {
          width: 300,
          height: 200
        },
        legend: {
          offsetX: -20 // Geser legend sedikit pada perangkat kecil
        }
      }
    }]
  };

  var chart3 = new ApexCharts(document.querySelector("#chart-lls-new"), options3);
  chart3.render();

  // Geser hanya grafiknya
  document.querySelector("#chart-lls-new .apexcharts-canvas").style.marginLeft = "-50px";  // Geser grafik ke kiri

  // Menurunkan grafik ke bawah
  document.querySelector("#chart-lls-new .apexcharts-canvas").style.marginTop = "60px";  // Geser grafik ke bawah

</script>


<script>
    var tahunjadwal = <%= tahunjadwal %>;
    var jmldosenjdw = <%= jmldosenjdw %>;
    let Prodi = "<%= namaProdi %>";
    let kpiThresholds = <%= thresholdAKF.Text %>; 
    console.log(kpiThresholds);

    // Function to fill years up to the last 7 years
    function fillYears(tahunArray, jumlahArray) {
        let currentYear = new Date().getFullYear();
        let maxYears = [];
        let maxYear = Math.max(...tahunArray.map(year => parseInt(year)));
        let minYear = maxYear - 6;

        for (let i = maxYear; i >= minYear; i--) {
            maxYears.push(i.toString());
            if (!tahunArray.includes(i.toString())) {
                tahunArray.push(i.toString());
                jumlahArray.push(0);
            }
        }

        let sortedData = tahunArray.map((tahun, index) => ({
            year: tahun,
            value: jumlahArray[index]
        })).sort((a, b) => parseInt(a.year) - parseInt(b.year));

        let sortedYears = sortedData.map(item => item.year);
        let sortedValues = sortedData.map(item => item.value);

        return { sortedYears, sortedValues };
    }

    // Fill missing years and prepare data
    var jadwalData = fillYears(tahunjadwal, jmldosenjdw);
    tahunjadwal = jadwalData.sortedYears;
    jmldosenjdw = jadwalData.sortedValues;

    // Prepare target KPI values (thresholds) to align with years
    let targetValues = tahunjadwal.map(year => kpiThresholds[year] || 0);

    // Prepare annotations for decreases
    let decreaseAnnotations = [];
    for (let i = 0; i < jmldosenjdw.length; i++) {
        const targetThreshold = targetValues[i];
        if (targetThreshold && jmldosenjdw[i] < targetThreshold) {
            let decreaseAmount = targetThreshold - jmldosenjdw[i];
            decreaseAnnotations.push({
                x: tahunjadwal[i],
                y: jmldosenjdw[i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                        background: '#FFFFFF',
                        borderRadius: '2px'
                    },
                    text: `Turun: ${decreaseAmount}`,
                    position: 'left',
                    offsetX: -10,
                    offsetY: -15
                }
            });
        }
    }

    var options = {
        series: [
            { name: "Jumlah Dosen", data: jmldosenjdw }, // Actual values
            { name: "Target KPI", data: targetValues }   // Target KPI values
        ],
        chart: {
            height: 350,
            type: 'line',
            dropShadow: { enabled: true, color: '#000', top: 18, left: 7, blur: 10, opacity: 0.2 },
            zoom: { enabled: false },
            toolbar: { show: true }
        },
        colors: ['#77B6EA', '#FF0000'], // Blue for actual, Red for target
        dataLabels: { enabled: true },
        stroke: { curve: 'straight', width: [3, 2], dashArray: [0, 5] }, // Dashed line for target KPI
        title: { text: `Jumlah Dosen dan Target KPI Prodi ${Prodi}`, align: 'left' },
        grid: { borderColor: '#e7e7e7', row: { colors: ['#f3f3f3', 'transparent'], opacity: 0.5 } },
        markers: { size: 4 },
        xaxis: { categories: tahunjadwal, title: { text: 'Tahun Akademik' } },
        yaxis: {
            title: { text: 'Jumlah' },
            labels: { formatter: function(val) { return val.toFixed(0); } }
        },
        annotations: {
            points: decreaseAnnotations
        },
        legend: { position: 'top', horizontalAlign: 'right', floating: true, offsetY: -25, offsetX: -5 }
    };

    // Render the chart
    var chart = new ApexCharts(document.querySelector("#jadwal-chart"), options);
    chart.render();

</script>


<script>
    var tahunstatus = <%= tahunstatus %>;
    var statustetap = <%= statustetap %>;
    var statustdktetap = <%= statustdktetap %>;
    let Prodi2 = "<%= namaProdi %>";
    let kpiThresholdsTDP = <%= thresholdTDP.Text %>;
    let kpiThresholdsTTP = <%= thresholdTTP.Text %>;
    let targetValuesTDP = []; 
    let targetValuesTTP = []; 

    // Function to sync years with data
    function syncYearsWithData(tahunArray, jumlahTetapArray, jumlahTidakTetapArray) {
        let maxYear = Math.max(...tahunArray.map(Number));
        let minYear = maxYear - 6;
        let completeYears = [];

        for (let i = minYear; i <= maxYear; i++) {
            completeYears.push(i.toString());
            if (!tahunArray.includes(i.toString())) {
                tahunArray.push(i.toString());
                jumlahTetapArray.push(0);
                jumlahTidakTetapArray.push(0);
            }
        }

        let sortedData = tahunArray.map((tahun, index) => ({
            year: tahun,
            tetap: jumlahTetapArray[index],
            tdktetap: jumlahTidakTetapArray[index] || 0
        })).sort((a, b) => parseInt(a.year) - parseInt(b.year));

        let sortedYears = sortedData.map(item => item.year);
        let sortedTetap = sortedData.map(item => item.tetap);
        let sortedTdktetap = sortedData.map(item => item.tdktetap);

        return { sortedYears, sortedTetap, sortedTdktetap };
    }

    // Sync the data
    var statusData = syncYearsWithData(tahunstatus, statustetap, statustdktetap);
    tahunstatus = statusData.sortedYears;
    statustetap = statusData.sortedTetap;
    statustdktetap = statusData.sortedTdktetap;

    // Prepare target KPI values
    for (let i = 0; i < tahunstatus.length; i++) {
        const year = tahunstatus[i];
        targetValuesTDP.push(kpiThresholdsTDP[year] || 0);
        targetValuesTTP.push(kpiThresholdsTTP[year] || 0);
    }

    // Chart options with Target KPI series
    var options2 = {
        series: [
            { name: "Tetap", data: statustetap },
            { name: "Tidak Tetap", data: statustdktetap },
            { name: "Target KPI Tetap", data: targetValuesTTP},
            { name: "Target KPI Tidak Tetap", data: targetValuesTDP}
        ],
        chart: { 
            height: 350, 
            type: 'line', 
            dropShadow: { enabled: true, color: '#000', top: 18, left: 7, blur: 10, opacity: 0.2 }, 
            zoom: { enabled: false }, 
            toolbar: { show: true }
        },
        colors: ['#387F39', '#FFB22C', '#008FFB', '#FF4560'], // Additional colors for KPI
        dataLabels: { enabled: true },
        stroke: { 
            curve: 'straight', 
            width: [3, 3, 2, 2], 
            dashArray: [0, 0, 5, 5] // Dashed lines for Target KPI
        },
        title: { text: `Jumlah Dosen Tetap/Tidak Tetap Prodi ${Prodi2}`, align: 'left' },
        grid: { borderColor: '#e7e7e7', row: { colors: ['#f3f3f3', 'transparent'], opacity: 0.5 }},
        markers: { size: 4, colors: ['#FFB22C', '#387F39', '#008FFB', '#FF4560'], strokeColor: '#fff', strokeWidth: 2 },
        xaxis: { categories: tahunstatus, title: { text: 'Tahun Akademik' }},
        yaxis: { 
            title: { text: 'Jumlah' }, 
            min: 0,  
            max: Math.max(...statustetap, ...statustdktetap, ...targetValuesTDP, ...targetValuesTTP) + 2,
            labels: { formatter: function(val) { return val.toFixed(0); }}
        },
        legend: { position: 'top', horizontalAlign: 'right', floating: true, offsetY: -25, offsetX: -5 }
    };

    var chart2 = new ApexCharts(document.querySelector("#jmlsts-chart"), options2);
    chart2.render();
</script>



<script>
    var tahungelar = <%= tahungelar %>;
    var gelarp6 = <%= gelarp6 %>;
    var gelarp7 = <%= gelarp7 %>;
    let Prodi3 = "<%= namaProdi %>";
    let kpiThresholdsMGR = <%= thresholdMGR.Text %>;
    let kpiThresholdsDKR = <%= thresholdDKR.Text %>;
    let targetValuesMGR = []; 
    let targetValuesDKR = [];

    // Function to sync years with data for degrees
    function syncYearsWithDataGelar(tahunArray, jumlahP6Array, jumlahP7Array) {
        let maxYear = Math.max(...tahunArray.map(Number));
        let minYear = maxYear - 6;
        let completeYears = [];

        for (let i = minYear; i <= maxYear; i++) {
            completeYears.push(i.toString());
            if (!tahunArray.includes(i.toString())) {
                tahunArray.push(i.toString());
                jumlahP6Array.push(0);
                jumlahP7Array.push(0);
            }
        }

        let sortedData = tahunArray.map((tahun, index) => ({
            year: tahun,
            p6: jumlahP6Array[index],
            p7: jumlahP7Array[index] || 0
        })).sort((a, b) => parseInt(a.year) - parseInt(b.year));

        let sortedYears = sortedData.map(item => item.year);
        let sortedP6 = sortedData.map(item => item.p6);
        let sortedP7 = sortedData.map(item => item.p7);

        return { sortedYears, sortedP6, sortedP7 };
    }

    // Sync the data
    var gelarData = syncYearsWithDataGelar(tahungelar, gelarp6, gelarp7);
    tahungelar = gelarData.sortedYears;
    gelarp6 = gelarData.sortedP6;
    gelarp7 = gelarData.sortedP7;

    // Prepare target KPI values
    for (let i = 0; i < tahungelar.length; i++) {
        const year = tahungelar[i];
        targetValuesMGR.push(kpiThresholdsMGR[year] || 0);
        targetValuesDKR.push(kpiThresholdsDKR[year] || 0);
    }

    let AnnotationsglrP6 = [];
    for (let i = 1; i < gelarp6.length; i++) {
        const targetThresholdMGR = kpiThresholdsMGR[tahungelar[i]]; // Assuming tahungelar holds the years for MGR
        if (targetThresholdMGR && gelarp6[i] < targetThresholdMGR) {
            let decreaseAmount = targetThresholdMGR - gelarp6[i];
            AnnotationsglrP6.push({
                x: tahungelar[i],  // Assuming the years are the same for gelarp6 and thresholdMGR
                y: gelarp6[i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                        background: '#FFFFFF',
                        borderRadius: '2px'
                    },
                    text: `Turun: ${decreaseAmount}`,
                    position: 'right',
                    offsetX: -10,
                    offsetY: -15
                }
            });
        }
    }

    // Annotations for Gelar P7
    let AnnotationsglrP7 = [];
    for (let i = 1; i < gelarp7.length; i++) {
        const targetThresholdDKR = kpiThresholdsDKR[tahungelar[i]]; // Assuming tahungelar holds the years for DKR
        if (targetThresholdDKR && gelarp7[i] < targetThresholdDKR) {
            let decreaseAmount = targetThresholdDKR - gelarp7[i];
            AnnotationsglrP7.push({
                x: tahungelar[i],  // Assuming the years are the same for gelarp7 and thresholdDKR
                y: gelarp7[i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                        background: '#FFFFFF',
                        borderRadius: '2px'
                    },
                    text: `Turun: ${decreaseAmount}`,
                    position: 'right',
                    offsetX: -10,
                    offsetY: -15
                }
            });
        }
    }

    // Chart options
    var optionsGelar = {
        series: [
            { name: "Gelar Magister", data: gelarp6 },
            { name: "Gelar Doktor", data: gelarp7 },
            { name: "Target KPI Magister", data: targetValuesMGR},
            { name: "Target KPI Doktor", data: targetValuesDKR}
        ],
        chart: { height: 350, type: 'line', dropShadow: { enabled: true, color: '#000', top: 18, left: 7, blur: 10, opacity: 0.2 }, zoom: { enabled: false }, toolbar: { show: true }}, offsetY: 10,
        colors: ['#1230AE', '#FFB22C', '#008FFB', '#FF4560'],
        dataLabels: { enabled: true },
        stroke: {
            curve: 'straight', 
            width: [3, 3, 2, 2], 
            dashArray: [0, 0, 5, 5]
        },
        title: { text: `Jumlah Gelar Magister/Doktor Prodi ${Prodi3}`, align: 'left' },
        grid: { borderColor: '#e7e7e7', row: { colors: ['#f3f3f3', 'transparent'], opacity: 0.5 }},
        markers: { size: 4, colors: ['#FFB22C', '#1230AE', '#008FFB', '#FF4560'], strokeColor: '#fff', strokeWidth: 2 },
        annotations: {
            points: [...AnnotationsglrP6, ...AnnotationsglrP7, ...targetValuesMGR, ...targetValuesDKR] // Gabungkan anotasi
        },
        xaxis: { categories: tahungelar, title: { text: 'Tahun Akademik' }},
        yaxis: { title: { text: 'Jumlah' }, labels: { formatter: function(val) { return val.toFixed(0); }}},
        legend: { position: 'top', horizontalAlign: 'right', floating: true, offsetY: -25, offsetX: -5 }
    };

    var chartGelar = new ApexCharts(document.querySelector("#jmlgelar-chart"), optionsGelar);
    chartGelar.render();
</script>


<script>
    var tahunbimbinganBim = <%= tahunbimbinganbim %>;
    var pssendiriBim = <%= pssendiribim %>;
    var pslainBim = <%= pslainbim %>;
    let prodibim = "<%= namaProdi %>";
    let kpiThresholdsPSSBim = <%= thresholdPSS.Text %>;
    let kpiThresholdsPSLBim = <%= thresholdPSL.Text %>;
    
    // Function to sync years with data
    function syncYearsWithDataBim(tahunArrayBim, jumlahTetapArrayBim, jumlahTidakTetapArrayBim) {
        let maxYearBim = Math.max(...tahunArrayBim.map(Number));
        let minYearBim = maxYearBim - 6;
        let completeYearsBim = [];

        for (let i = minYearBim; i <= maxYearBim; i++) {
            completeYearsBim.push(i.toString());
            if (!tahunArrayBim.includes(i.toString())) {
                tahunArrayBim.push(i.toString());
                jumlahTetapArrayBim.push(0);
                jumlahTidakTetapArrayBim.push(0);
            }
        }

        let sortedDataBim = tahunArrayBim.map((tahunBim, index) => ({
            year: tahunBim,
            tetap: jumlahTetapArrayBim[index],
            tdktetap: jumlahTidakTetapArrayBim[index] || 0
        })).sort((a, b) => parseInt(a.year) - parseInt(b.year));

        let sortedYearsBim = sortedDataBim.map(item => item.year);
        let sortedTetapBim = sortedDataBim.map(item => item.tetap);
        let sortedTdktetapBim = sortedDataBim.map(item => item.tdktetap);

        return { sortedYearsBim, sortedTetapBim, sortedTdktetapBim };
    }

    // Sync the data
    var statusDataBim = syncYearsWithDataBim(tahunbimbinganBim, pssendiriBim, pslainBim);
    tahunbimbinganBim = statusDataBim.sortedYearsBim;
    pssendiriBim = statusDataBim.sortedTetapBim;
    pslainBim = statusDataBim.sortedTdktetapBim;

    // Define arrays for target KPI values
    let targetValuesPSS = [];
    let targetValuesPSL = [];

    // Populate target KPI values (just an example, adapt with your own logic)
    for (let i = 0; i < tahunbimbinganBim.length; i++) {
        let targetPSS = kpiThresholdsPSSBim[tahunbimbinganBim[i]] || 0; // Get target value for Tetap
        let targetPSL = kpiThresholdsPSLBim[tahunbimbinganBim[i]] || 0; // Get target value for Tidak Tetap
        targetValuesPSS.push(targetPSS);
        targetValuesPSL.push(targetPSL);
    }

    // For "status tetap" with threshold comparison
    let Anotasisendiribim = [];
    for (let i = 0; i < pssendiriBim.length; i++) {
        const targetThresholdBim = kpiThresholdsPSSBim[tahunbimbinganBim[i]];

        if (targetThresholdBim && pssendiriBim[i] < targetThresholdBim) {
            let decreaseAmountBim = targetThresholdBim - pssendiriBim[i];
            Anotasisendiribim.push({
                x: tahunbimbinganBim[i],
                y: pssendiriBim[i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                        background: '#FFFFFF',
                        borderRadius: '2px'
                    },
                    text: `Turun: ${decreaseAmountBim}`,
                    position: 'top',  
                    offsetX: -10,   
                    offsetY: -15  
                }
            });
        }
    }

    // For "status tidak tetap" with threshold comparison
    let Anotasilainbim = [];
    for (let i = 0; i < pslainBim.length; i++) {
        const targetThresholdBim = kpiThresholdsPSLBim[tahunbimbinganBim[i]];

        if (targetThresholdBim && pslainBim[i] < targetThresholdBim) {
            let decreaseAmountBim = targetThresholdBim - pslainBim[i];
            Anotasilainbim.push({
                x: tahunbimbinganBim[i],
                y: pslainBim[i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                        background: '#FFFFFF',
                        borderRadius: '2px'
                    },
                    text: `Turun: ${decreaseAmountBim}`,
                    position: 'top', 
                    offsetX: -10,
                    offsetY: -15
                }
            });
        }
    }

    // Chart options with a fixed y-axis range
    var optionbim = {
        series: [
            { name: "Prodi Sendiri", data: pssendiriBim },
            { name: "Prodi Lain", data: pslainBim },
            { name: "Target KPI Tetap", data: targetValuesPSS },
            { name: "Target KPI Tidak Tetap", data: targetValuesPSL }
        ],
        chart: { 
            height: 350, 
            type: 'line', 
            dropShadow: { enabled: true, color: '#000', top: 18, left: 7, blur: 10, opacity: 0.2 }, 
            zoom: { enabled: false }, 
            toolbar: { show: true }
        },
        colors: ['#387F39', '#FFB22C', '#FF5733', '#33A6FF'], // Add colors for the target lines
        dataLabels: { enabled: true },
        stroke: {
            curve: 'straight', 
            width: [3, 3, 2, 2], 
            dashArray: [0, 0, 5, 5]
        },
        title: { text: `Jumlah Bimbingan Skripsi Dosen Prodi ${prodibim}`, align: 'left' },
        grid: { borderColor: '#e7e7e7', row: { colors: ['#f3f3f3', 'transparent'], opacity: 0.5 }},
        markers: { size: 4, colors: ['#FFB22C', '#387F39', '#FF5733', '#33A6FF'], strokeColor: '#fff', strokeWidth: 2 },
        xaxis: { categories: tahunbimbinganBim, title: { text: 'Tahun Akademik' }},
        yaxis: { 
            title: { text: 'Jumlah' }, 
            min: 0,  
            max: Math.max(...pssendiriBim, ...pslainBim, ...targetValuesPSL, ...targetValuesPSS) + 2, 
            labels: { formatter: function(val) { return val.toFixed(0); }}
        },
        annotations: {
            points: [...Anotasisendiribim, ...Anotasilainbim]
        },
        legend: { position: 'top', horizontalAlign: 'right', floating: true, offsetY: -25, offsetX: -5 }
    };

    var chartbim = new ApexCharts(document.querySelector("#jmlbim-chart"), optionbim);
    chartbim.render();
</script>



<script>
    var unitkerja = <%= unitkerja %>;
    var jml_tetap = <%= jml_tetap %>;
    var jml_tidak = <%= jml_tidak %>;
    let Prodi2 = "<%= namaProdi %>";
    let kpiThresholdsTTP = <%= thresholdTTP2.Text %>;
    let kpiThresholdsTDP = <%= thresholdTDP2.Text %>;
    let targetValuesTTP2 = []; 
    let targetValuesTDP2 = [];

    let Annotationsststetap = [];
    for (let i = 0; i < jml_tetap.length; i++) {
        const targetThresholdTTP = kpiThresholdsTTP[unitkerja[i]];

        if (targetThresholdTTP && jml_tetap[i] < targetThresholdTTP) {
            let decreaseAmount = targetThresholdTTP - jml_tetap[i];
            Annotationsststetap.push({
                x: unitkerja[i],  
                y: jml_tetap[i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                        background: '#FFFFFF',
                        borderRadius: '2px'
                    },
                    text: `Turun: ${decreaseAmount}`,
                    position: 'left',
                    offsetX: -10,
                    offsetY: -10
                }
            });
        }
    }

    let Annotationsststidk = [];
    for (let i = 0; i < jml_tidak.length; i++) {
        const targetThresholdTDP = kpiThresholdsTDP[unitkerja[i]];

        if (targetThresholdTDP && jml_tidak[i] < targetThresholdTDP) {
            let decreaseAmount = targetThresholdTDP - jml_tidak[i];
            Annotationsststidk.push({
                x: unitkerja[i],  
                y: jml_tidak[i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                        background: '#FFFFFF',
                        borderRadius: '2px'
                    },
                    text: `Turun: ${decreaseAmount}`,
                    position: 'left',
                    offsetX: -10,
                    offsetY: -10
                }
            });
        }
    }

    // Prepare target KPI values
    for (let i = 0; i < unitkerja.length; i++) {
        const year = unitkerja[i];
        targetValuesTTP2.push(kpiThresholdsTTP[year] || 0);
        targetValuesTDP2.push(kpiThresholdsTDP[year] || 0);
    }

    // Chart options
    var options2 = {
        series: [
            { name: "Tetap", data: jml_tetap },
            { name: "Tidak Tetap", data: jml_tidak },
            { name: "Target KPI Tetap", data: targetValuesTTP2},
            { name: "Target KPI Tidak Tetap", data: targetValuesTDP2}
        ],
        chart: { height: 350, type: 'line', dropShadow: { enabled: true, color: '#000', top: 18, left: 7, blur: 10, opacity: 0.2 }, zoom: { enabled: false }, toolbar: { show: true }},
        colors: ['#387F39', '#FFB22C', '#008FFB', '#FF4560'],
        dataLabels: { enabled: true },
        stroke: {
            curve: 'straight', 
            width: [3, 3, 2, 2], 
            dashArray: [0, 0, 5, 5]
        },
        title: { text: `Jumlah Karyawan Tetap/Tidak Tetap Prodi ${Prodi2}`, align: 'left' },
        grid: { borderColor: '#e7e7e7', row: { colors: ['#f3f3f3', 'transparent'], opacity: 0.5 }},
        markers: { size: 4, colors: ['#FFB22C', '#387F39', '#008FFB', '#FF4560'], strokeColor: '#fff', strokeWidth: 2 },
        xaxis: { categories: unitkerja, title: { text: 'Tahun Aktif Pegawai' }},
        yaxis: { title: { text: 'Jumlah' }, labels: { formatter: function(val) { return val.toFixed(0); }}},
        annotations: {
            points: [...Annotationsststetap, ...Annotationsststidk, ...targetValuesTTP2, ...targetValuesTDP2] // Gabungkan anotasi
        },
        legend: { position: 'top', horizontalAlign: 'right', floating: true, offsetY: -25, offsetX: -5 }
    };

    var chart2 = new ApexCharts(document.querySelector("#sts-chart"), options2);
    chart2.render();
</script>

<script>
    // Arrays with data for each educational category
    var unitkerja = <%= unitkerja %>;
    var jml_mg = <%= strMagister %>;      // Magister
    var jml_dip = <%= strDiploma %>;    // Diploma
    var jml_dk = <%= strDoktor %>;      // Doktor
    var jml_sr = <%= strSarjana %>;      // Sarjana
    let kpiThresholdsDIP = <%= thresholdDIP2.Text %>;
    let kpiThresholdsSRJ = <%= thresholdSRJ2.Text %>;
    let kpiThresholdsMGR = <%= thresholdMGR2.Text %>;
    let kpiThresholdsDKR = <%= thresholdDKR2.Text %>;
    let targetValuesDIP = []; 
    let targetValuesSRJ = [];
    let targetValuesMGR = []; 
    let targetValuesDKR = [];

    // Prepare target KPI values
    for (let i = 0; i < unitkerja.length; i++) {
        const year = unitkerja[i];
        targetValuesDIP.push(kpiThresholdsDIP[year] || 0);
        targetValuesSRJ.push(kpiThresholdsSRJ[year] || 0);
        targetValuesMGR.push(kpiThresholdsMGR[year] || 0);
        targetValuesDKR.push(kpiThresholdsDKR[year] || 0);
    }

    // Annotations for Magister, Diploma, Doktor, Sarjana
    let annotationsMg = [];
    for (let i = 0; i < jml_mg.length; i++) {
        const targetThresholdMGR = kpiThresholdsMGR[unitkerja[i]];

        if (targetThresholdMGR && jml_mg[i] < targetThresholdMGR) {
            let decreaseAmount = targetThresholdMGR - jml_mg[i];
            annotationsMg.push({
                x: unitkerja[i],
                y: jml_mg[i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                        background: '#FFFFFF',
                        borderRadius: '2px'
                    },
                    text: `Turun: ${decreaseAmount}`,
                    position: 'left',
                    offsetX: -10,
                    offsetY: -10
                }
            });
        }
    }
    let annotationsDip = [];
    for (let i = 0; i < jml_dip.length; i++) {
        const targetThresholdDIP = kpiThresholdsDIP[unitkerja[i]];

        if (targetThresholdDIP && jml_dip[i] < targetThresholdDIP) {
            let decreaseAmount = targetThresholdDIP - jml_dip[i];
            annotationsDip.push({
                x: unitkerja[i],
                y: jml_dip[i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                        background: '#FFFFFF',
                        borderRadius: '2px'
                    },
                    text: `Turun: ${decreaseAmount}`,
                    position: 'left',
                    offsetX: -10,
                    offsetY: -10
                }
            });
        }
    }

    let annotationsSrj = [];
    for (let i = 0; i < jml_sr.length; i++) {
        const targetThresholdSRJ = kpiThresholdsSRJ[unitkerja[i]];

        if (targetThresholdSRJ && jml_sr[i] < targetThresholdSRJ) {
            let decreaseAmount = targetThresholdSRJ - jml_sr[i];
            annotationsSrj.push({
                x: unitkerja[i],
                y: jml_sr[i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                        background: '#FFFFFF',
                        borderRadius: '2px'
                    },
                    text: `Turun: ${decreaseAmount}`,
                    position: 'left',
                    offsetX: -10,
                    offsetY: -10
                }
            });
        }
    }

    let annotationsDkr = [];
    for (let i = 0; i < jml_dk.length; i++) {
        const targetThresholdDKR = kpiThresholdsDKR[unitkerja[i]];

        if (targetThresholdDKR && jml_dk[i] < targetThresholdDKR) {
            let decreaseAmount = targetThresholdDKR - jml_dk[i];
            annotationsDkr.push({
                x: unitkerja[i],
                y: jml_dk[i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                        background: '#FFFFFF',
                        borderRadius: '2px'
                    },
                    text: `Turun: ${decreaseAmount}`,
                    position: 'left',
                    offsetX: -10,
                    offsetY: -10
                }
            });
        }
    }

    var options = {
        series: [
            { name: "Magister", data: jml_mg },
            { name: "Diploma", data: jml_dip },
            { name: "Doktor", data: jml_dk },
            { name: "Sarjana", data: jml_sr },
            { name: "Target KPI Diploma", data: targetValuesDIP},
            { name: "Target KPI Sarjana", data: targetValuesSRJ},
            { name: "Target KPI Magister", data: targetValuesMGR},
            { name: "Target KPI Doktor", data: targetValuesDKR}
        ],
        chart: { 
            height: 350, 
            type: 'line', 
            dropShadow: { enabled: true, color: '#000', top: 18, left: 7, blur: 10, opacity: 0.2 }, 
            zoom: { enabled: false }, 
            toolbar: { show: true }
        },
        colors: ['#387F39', '#FFB22C', '#1E90FF', '#FF6347', '#008FFB', '#FF4560', '#800080', '#8B4513'],  // Different colors for each line
        dataLabels: { enabled: true },
        stroke: {
            curve: 'straight', 
            width: [3, 3, 3, 3, 2, 2, 2, 2], 
            dashArray: [0, 0, 0, 0, 5, 5, 5, 5]
        },
        title: { text: `Jumlah Karyawan Berdasarkan Pendidikan`, align: 'left' },
        grid: { borderColor: '#e7e7e7', row: { colors: ['#f3f3f3', 'transparent'], opacity: 0.5 }},
        markers: { size: 4, colors: ['#FFB22C', '#387F39', '#1E90FF', '#FF6347', '#008FFB', '#FF4560', '#800080', '#8B4513'], strokeColor: '#fff', strokeWidth: 2 },
        xaxis: { categories: unitkerja, title: { text: 'Tahun Aktif Pegawai' }},
        yaxis: { title: { text: 'Jumlah' }, labels: { formatter: function(val) { return val.toFixed(0); }}},
        annotations: {
            points: [...annotationsMg, ...annotationsDip, ...annotationsSrj, ...annotationsDkr]  // Add annotations arrays as needed for each category
        },
        legend: { position: 'top', horizontalAlign: 'right', floating: true, offsetY: -25, offsetX: -5 }
    };

    var chart = new ApexCharts(document.querySelector("#pend-chart"), options);
    chart.render();
</script>

<% Response.write("<script>let tahun_lulusan = " & tahun_lulusan & ";let jml_lulus = " & jml_lulus & ";let jml_lacak = " & jml_lacak & "</script>") %>

<script>
    let Prodi2 = "<%= namaProdi %>";
    let kpiThresholds_6 = <%= threshold_6.Text %>;
    let targetValues_6 = [];
    tahun_lulusan.sort(function(a, b) {
        return a - b;
    });

    // Prepare target KPI values
    for (let i = 0; i < tahun_lulusan.length; i++) {
        const year = tahun_lulusan[i];
        targetValues_6.push(kpiThresholds_6[year] || 0);
    }

    let anotasilulusan = [];
    for (let i = 0; i < jml_lulus.length; i++) {
        const targetkpiThresholds_6 = kpiThresholds_6[tahun_lulusan[i]];

        if (targetkpiThresholds_6 && jml_lulus[i] < targetkpiThresholds_6) {
            let decreaseAmount = targetkpiThresholds_6 - jml_lulus[i];
            anotasilulusan.push({
                x: tahun_lulusan[i],  // Assuming the years are the same for newreg and newtrf
                y: jml_lulus[i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                        background: '#FFFFFF',
                        borderRadius: '2px'
                    },
                    text: `Turun: ${decreaseAmount}`,
                    position: 'left',
                    offsetX: -10,
                    offsetY: -10
                }
            });
        }
    }

    let anotasilacak = [];
    for (let i = 1; i < jml_lacak.length; i++) {
        if (jml_lacak[i] < jml_lacak[i - 1]) {
            let decreaseAmount = (jml_lacak[i - 1] - jml_lacak[i]); // Round to 2 decimal places
            anotasilacak.push({
                x: tahun_lulusan[i],  // Assuming the years are the same for newreg and newtrf
                y: jml_lacak[i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                        background: '#FFFFFF',
                        borderRadius: '2px'
                    },
                    text: `Turun: ${decreaseAmount}`,
                    position: 'left',
                    offsetX: -10,
                    offsetY: -10
                }
            });
        }
    }

    var options = {
        series: [
            {
                name: "Terlacak",
                data: jml_lacak
            },
            {
                name: "Lulusan",
                data: jml_lulus
            },
            { name: "Target KPI", data: targetValues_6}
        ],
        chart: {
            height: 350,
            type: 'line',
            dropShadow: {
                enabled: true,
                color: '#000',
                top: 18,
                left: 7,
                blur: 10,
                opacity: 0.2
            },
            zoom: {
                enabled: false
            },
            toolbar: {
                show: true
            }
        },
        colors: ['#77B6EA', '#FFB22C', '#008FFB'], // Added a color for the third variable
        dataLabels: {
            enabled: true,
        },
        stroke: {
            curve: 'straight', 
            width: [3, 3, 2], 
            dashArray: [0, 0, 5]
        },
        title: {
            text: `Jumlah Lulusan Prodi ${Prodi2}`,
            align: 'left'
        },
        grid: {
            borderColor: '#e7e7e7',
            row: {
                colors: ['#f3f3f3', 'transparent'],
                opacity: 0.5
            },
            xaxis: {
                lines: {
                    show: true
                }
            },
            yaxis: {
                lines: {
                    show: true
                }
            }
        },
        markers: {
            size: 4,
            colors: ['#FFB22C', '#77B6EA', '#008FFB'], // Added marker color for the third variable
            strokeColor: '#fff',
            strokeWidth: 2
        },
        xaxis: {
            categories: tahun_lulusan,
            title: {
                text: 'Tahun Lulus'
            }
        },
        yaxis: {
            title: {
                text: 'Jumlah Lulusan'
            },
            labels: {
                formatter: function (val) {
                    return val; 
                }
            }
        },
        annotations: {
            points: [...anotasilulusan, ...anotasilacak] // Gabungkan anotasi
        },
        legend: {
            position: 'top',
            horizontalAlign: 'right',
            floating: true,
            offsetY: -25,
            offsetX: -5
        }
    };

    var lulusan_lacakan = new ApexCharts(document.querySelector("#lls-chart"), options);
    lulusan_lacakan.render();
</script>


<% Response.write("<script>let jml_sesuai = " & jml_sesuai & ";let jml_tidak2 = " & jml_tidak2 & "</script>") %>

<script>
    let Prodibid = "<%= namaProdi %>";
    let kpiThresholdsSSI = <%= thresholdSSI.Text %>;
    let kpiThresholdsTSI = <%= thresholdTSI.Text %>;
    let targetValuesSSI = []; 
    let targetValuesTSI = [];
    tahun_lulusan.sort(function(a, b) {
        return a - b;
    });

    // Prepare target KPI values
    for (let i = 0; i < tahun_lulusan.length; i++) {
        const year = tahun_lulusan[i];
        targetValuesSSI.push(kpiThresholdsSSI[year] || 0);
        targetValuesTSI.push(kpiThresholdsTSI[year] || 0);
    }

    let anotasisesuai = [];
    for (let i = 0; i < jml_sesuai.length; i++) {
        const targetkpiThresholdsSSI = kpiThresholdsSSI[tahun_lulusan[i]];

        if (targetkpiThresholdsSSI && jml_sesuai[i] < targetkpiThresholdsSSI) {
            let decreaseAmount = targetkpiThresholdsSSI - jml_sesuai[i];
            anotasisesuai.push({
                x: tahun_lulusan[i],  // Assuming the years are the same for newreg and newtrf
                y: jml_sesuai[i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                        background: '#FFFFFF',
                        borderRadius: '2px'
                    },
                    text: `Turun: ${decreaseAmount}`,
                    position: 'left',
                    offsetX: -10,
                    offsetY: -10
                }
            });
        }
    }

    let anotasitidak = [];
    for (let i = 0; i < jml_tidak2.length; i++) {
        const targetkpiThresholdsTSI = kpiThresholdsTSI[tahun_lulusan[i]];

        if (targetkpiThresholdsTSI && jml_tidak2[i] < targetkpiThresholdsTSI) {
            let decreaseAmount = targetkpiThresholdsTSI - jml_tidak2[i];
            anotasitidak.push({
                x: tahun_lulusan[i],  // Assuming the years are the same for newreg and newtrf
                y: jml_tidak2[i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                        background: '#FFFFFF',
                        borderRadius: '2px'
                    },
                    text: `Turun: ${decreaseAmount}`,
                    position: 'left',
                    offsetX: -10,
                    offsetY: -10
                }
            });
        }
    }

    var optionsdm = {
        series: [
            {
                name: "Sesuai",
                data: jml_sesuai
            },
            {
                name: "Tidak Sesuai",
                data: jml_tidak2
            },
            { name: "Target KPI Sesuai", data: targetValuesSSI},
            { name: "Target KPI Tidak Sesuai", data: targetValuesTSI}
        ],
        chart: {
            height: 350,
            type: 'line',
            dropShadow: {
                enabled: true,
                color: '#000',
                top: 18,
                left: 7,
                blur: 10,
                opacity: 0.2
            },
            zoom: {
                enabled: false
            },
            toolbar: {
                show: true
            }
        },
        colors: ['#77B6EA', '#FFB22C', '#008FFB', '#FF4560'],
        dataLabels: {
            enabled: true,
        },
        stroke: {
            curve: 'straight', 
            width: [3, 3, 2, 2], 
            dashArray: [0, 0, 5, 5]
        },
        title: {
            text: `Jumlah Lulusan yang Bekerja sesuai/tidak Bidang Prodi ${Prodibid}`,
            align: 'left'
        },
        grid: {
            borderColor: '#e7e7e7',
            row: {
                colors: ['#f3f3f3', 'transparent'],
                opacity: 0.5
            },
            xaxis: {
                lines: {
                    show: true
                }
            },
            yaxis: {
                lines: {
                    show: true
                }
            }
        },
        markers: {
            size: 4,
            colors: ['#FFB22C', '#77B6EA', '#008FFB', '#FF4560'],
            strokeColor: '#fff',
            strokeWidth: 2
        },
        xaxis: {
            categories: tahun_lulusan,
            title: {
                text: 'Tahun Lulus'
            }
        },
        yaxis: {
            title: {
                text: 'Lulusan Terlacak'
            },
            categories: [...new Set(jml_lacak.sort((a, b) => a - b))],
            labels: {
                formatter: function (val) {
                    return val; // Menampilkan nilai asli
                }
            }
        },
        annotations: {
            points: [...anotasisesuai, ...anotasitidak] 
        },
        legend: {
            position: 'top',
            horizontalAlign: 'right',
            floating: true,
            offsetY: -25,
            offsetX: -5
        }
    };

    var chartdm = new ApexCharts(document.querySelector("#bid-chart"), optionsdm);
    chartdm.render();

</script>

<% Response.write("<script>let tahun_IPK = " & tahun_IPK & ";let ipk_min = " & ipk_min & ";let ipk_max = " & ipk_max & ";let ipk_avg = " & ipk_avg & "</script>") %>
<% Response.write("<script>let tahun_Lulus = " & tahun_Lulus & ";let jml_lulus2 = " & jml_lulus2 & "</script>") %>

<script>

    let Prodiipk = "<%= namaProdi %>";
    let kpiThresholdsIAV = <%= thresholdIAV.Text %>;
    let kpiThresholdsIMN = <%= thresholdIMN.Text %>;
    let kpiThresholdsIMX = <%= thresholdIMX.Text %>;
    let targetValuesIAV = []; 
    let targetValuesIMN = [];
    let targetValuesIMX = [];

    tahun_IPK.sort(function(a, b) {
        return a - b;
    });

    // Prepare target KPI values
    for (let i = 0; i < tahun_IPK.length; i++) {
        const year = tahun_IPK[i];
        targetValuesIAV.push(kpiThresholdsIAV[year] || 0);
        targetValuesIMN.push(kpiThresholdsIMN[year] || 0);
        targetValuesIMX.push(kpiThresholdsIMX[year] || 0);
    }

    let anotasiipkmin = [];
    for (let i = 0; i < ipk_min.length; i++) {
        const targetkpiThresholdsIMN = kpiThresholdsIMN[tahun_IPK[i]];

        if (targetkpiThresholdsIMN && ipk_min[i] < targetkpiThresholdsIMN) {
            let decreaseAmount = (targetkpiThresholdsIMN - ipk_min[i]).toFixed(2);

            anotasiipkmin.push({
                x: tahun_IPK[i],  // Assuming the years are the same for newreg and newtrf
                y: ipk_min[i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                        background: '#FFFFFF',
                        borderRadius: '2px'
                    },
                    text: `Turun: ${decreaseAmount}`,
                    position: 'left',
                    offsetX: -10,
                    offsetY: -10
                }
            });
        }
    }

    let anotasiipkavg = [];
    for (let i = 0; i < ipk_avg.length; i++) {
        const targetkpiThresholdsIAV = kpiThresholdsIAV[tahun_IPK[i]];

        if (targetkpiThresholdsIAV && ipk_avg[i] < targetkpiThresholdsIAV) {
            let decreaseAmount = (targetkpiThresholdsIAV - ipk_avg[i]).toFixed(2);
            anotasiipkavg.push({
                x: tahun_IPK[i],  // Assuming the years are the same for newreg and newtrf
                y: ipk_avg[i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                        background: '#FFFFFF',
                        borderRadius: '2px'
                    },
                    text: `Turun: ${decreaseAmount}`,
                    position: 'left',
                    offsetX: -10,
                    offsetY: -10
                }
            });
        }
    }

    let anotasiipkmax = [];
    for (let i = 0; i < ipk_max.length; i++) {
        const targetkpiThresholdsIMX = kpiThresholdsIMX[tahun_IPK[i]];

        if (targetkpiThresholdsIMX && ipk_max[i] < targetkpiThresholdsIMX) {
            let decreaseAmount = (targetkpiThresholdsIMX - ipk_max[i]).toFixed(2);
            anotasiipkmax.push({
                x: tahun_IPK[i],  // Assuming the years are the same for newreg and newtrf
                y: ipk_max[i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                        background: '#FFFFFF',
                        borderRadius: '2px'
                    },
                    text: `Turun: ${decreaseAmount}`,
                    position: 'left',
                    offsetX: -10,
                    offsetY: -10
                }
            });
        }
    }


    var options = {
        series: [
            {
                name: "IPK Max",
                data: ipk_max
            },
            {
                name: "IPK Min",
                data: ipk_min
            },
            {
                name: "IPK Avg", 
                data: ipk_avg 
            },
            { name: "Target KPI IPK Max", data: targetValuesIMX},
            { name: "Target KPI IPK Min", data: targetValuesIMN},
            { name: "Target KPI IPKM Avg", data: targetValuesIAV}
        ],
        chart: {
            height: 350,
            type: 'line',
            dropShadow: {
                enabled: true,
                color: '#000',
                top: 18,
                left: 7,
                blur: 10,
                opacity: 0.2
            },
            zoom: {
                enabled: false
            },
            toolbar: {
                show: true
            }
        },
        colors: ['#77B6EA', '#FFB22C', '#34C38F', '#008FFB', '#FF4560', '#8B4513'], // Added a color for the third variable
        dataLabels: {
            enabled: true,
        },
        stroke: {
            curve: 'straight', 
            width: [3, 3, 3, 2, 2, 2], 
            dashArray: [0, 0, 0, 5, 5, 5]
        },
        title: {
            text: `Indeks Prestasi Kumulatif Prodi ${Prodiipk}`,
            align: 'left'
        },
        grid: {
            borderColor: '#e7e7e7',
            row: {
                colors: ['#f3f3f3', 'transparent'],
                opacity: 0.5
            },
            xaxis: {
                lines: {
                    show: true
                }
            },
            yaxis: {
                lines: {
                    show: true
                }
            }
        },
        markers: {
            size: 4,
            colors: ['#FFB22C', '#77B6EA', '#34C38F', '#008FFB', '#FF4560', '#8B4513'], // Added marker color for the third variable
            strokeColor: '#fff',
            strokeWidth: 2
        },
        xaxis: {
            categories: tahun_IPK,
            title: {
                text: 'Tahun Lulus'
            }
        },
        yaxis: {
            title: {
                text: 'IPK'
            },
            labels: {
                formatter: function (val) {
                    return val.toFixed(2); 
                }
            }
        },
        annotations: {
            points: [...anotasiipkmin, ...anotasiipkmax, ...anotasiipkavg] // Gabungkan anotasi
        },
        legend: {
            position: 'top',
            horizontalAlign: 'right',
            floating: true,
            offsetY: -25,
            offsetX: -5
        }
    };

    var chart = new ApexCharts(document.querySelector("#ipk-chart"), options);
    chart.render();

    
</script>

<script>
    let Prodiipk2 = "<%= namaProdi %>";
    let kpiThresholds_62 = <%= threshold_62.Text %>;
    let targetValues_62 = [];
    tahun_Lulus.sort(function(a, b) {
        return a - b;
    });

    // Prepare target KPI values
    for (let i = 0; i < tahun_Lulus.length; i++) {
        const year = tahun_Lulus[i];
        targetValues_62.push(kpiThresholds_62[year] || 0);
    }

    let anotasijmllulus = [];
    for (let i = 0; i < jml_lulus2.length; i++) {
        const targetkpiThresholds_62 = kpiThresholds_62[tahun_Lulus[i]];

        if (targetkpiThresholds_62 && jml_lulus2[i] < targetkpiThresholds_62) {
            let decreaseAmount = targetkpiThresholds_62 - jml_lulus2[i];
            anotasijmllulus.push({
                x: tahun_Lulus[i],  // Assuming the years are the same for newreg and newtrf
                y: jml_lulus2[i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                        background: '#FFFFFF',
                        borderRadius: '2px'
                    },
                    text: `Turun: ${decreaseAmount}`,
                    position: 'left',
                    offsetX: -10,
                    offsetY: -10
                }
            });
        }
    }
    
    var optionsJmlLulus = {
        series: [
            {
                name: "Jumlah Lulusan",
                data: jml_lulus2
            },
            { name: "Target KPI", data: targetValues_62}
        ],
        chart: {
            height: 350,
            type: 'line',
            dropShadow: {
                enabled: true,
                color: '#000',
                top: 18,
                left: 7,
                blur: 10,
                opacity: 0.2
            },
            zoom: {
                enabled: false
            },
            toolbar: {
                show: true
            }
        },
        colors: ['#34C38F', '#008FFB'], // You can change the color as needed
        dataLabels: {
            enabled: true,
        },
        stroke: {
            curve: 'straight', 
            width: [3, 2], 
            dashArray: [0, 5]
        },
        title: {
            text: `Jumlah Lulusan Prodi ${Prodiipk2}`,
            align: 'left'
        },
        grid: {
            borderColor: '#e7e7e7',
            row: {
                colors: ['#f3f3f3', 'transparent'],
                opacity: 0.5
            },
            xaxis: {
                lines: {
                    show: true
                }
            },
            yaxis: {
                lines: {
                    show: true
                }
            }
        },
        markers: {
            size: 4,
            colors: ['#34C38F', '#008FFB'],
            strokeColor: '#fff',
            strokeWidth: 2
        },
        xaxis: {
            categories: tahun_Lulus,
            title: {
                text: 'Tahun Lulus'
            }
        },
        yaxis: {
            title: {
                text: 'Jumlah Lulusan'
            },
            labels: {
                formatter: function (val) {
                    return Math.floor(val); // Format the label as an integer
                }
            }
        },
        annotations: {
            points: [...anotasijmllulus] // Gabungkan anotasi
        },
        legend: {
            position: 'top',
            horizontalAlign: 'right',
            floating: true,
            offsetY: -25,
            offsetX: -5
        }
    };

    var chartJmlLulus = new ApexCharts(document.querySelector("#jml-lulus-chart"), optionsJmlLulus);
    chartJmlLulus.render();
</script>

<% Response.write("<script>let jml_lulus3 = " & jml_lulus3 & ";let jml_lacak3 = " & jml_lacak3 & "</script>") %>

<% Response.write("<script>let tahun_lulusan3 = " & tahun_lulusan3 & ";let t_lokal = " & t_lokal & ";let t_nasional = " & t_nasional & ";let t_multi = " & t_multi & "</script>") %>

<script>
    let Prodi = "<%= namaProdi %>";
    let kpiThresholdsLOK = <%= thresholdLOK.Text %>;
    let kpiThresholdsNAS = <%= thresholdNAS.Text %>;
    let kpiThresholdsMUL = <%= thresholdMUL.Text %>;
    let targetValuesLOK = []; 
    let targetValuesNAS = [];
    let targetValuesMUL = [];
    tahun_lulusan3.sort(function(a, b) {
        return a - b;
    });

    // Prepare target KPI values
    for (let i = 0; i < tahun_lulusan3.length; i++) {
        const year = tahun_lulusan3[i];
        targetValuesLOK.push(kpiThresholdsLOK[year] || 0);
        targetValuesNAS.push(kpiThresholdsNAS[year] || 0);
        targetValuesMUL.push(kpiThresholdsIMX[year] || 0);
    }

    let anotasilokal = [];
    for (let i = 0; i < t_lokal.length; i++) {
        const targetkpiThresholdsLOK = kpiThresholdsLOK[tahun_lulusan3[i]];

        if (targetkpiThresholdsLOK && t_lokal[i] < targetkpiThresholdsLOK) {
            let decreaseAmount = targetkpiThresholdsLOK - t_lokal[i];
            anotasilokal.push({
                x: tahun_lulusan3[i],  // Assuming the years are the same for newreg and newtrf
                y: t_lokal[i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                        background: '#FFFFFF',
                        borderRadius: '2px'
                    },
                    text: `Turun: ${decreaseAmount}`,
                    position: 'left',
                    offsetX: -10,
                    offsetY: -10
                }
            });
        }
    }

    let anotasinasional = [];
    for (let i = 0; i < t_nasional.length; i++) {
        const targetkpiThresholdsNAS = kpiThresholdsNAS[tahun_lulusan3[i]];

        if (targetkpiThresholdsNAS && t_nasional[i] < targetkpiThresholdsNAS) {
            let decreaseAmount = targetkpiThresholdsNAS - t_nasional[i];
            anotasinasional.push({
                x: tahun_lulusan3[i],  // Assuming the years are the same for newreg and newtrf
                y: t_nasional[i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                        background: '#FFFFFF',
                        borderRadius: '2px'
                    },
                    text: `Turun: ${decreaseAmount}`,
                    position: 'left',
                    offsetX: -10,
                    offsetY: -10
                }
            });
        }
    }

    let anotasimulti = [];
    for (let i = 0; i < t_multi.length; i++) {
        const targetkpiThresholdsMUL = kpiThresholdsMUL[tahun_lulusan3[i]];

        if (targetkpiThresholdsMUL && t_multi[i] < targetkpiThresholdsMUL) {
            let decreaseAmount = targetkpiThresholdsMUL - t_multi[i];
            anotasimulti.push({
                x: tahun_lulusan3[i],  // Assuming the years are the same for newreg and newtrf
                y: t_multi[i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                        background: '#FFFFFF',
                        borderRadius: '2px'
                    },
                    text: `Turun: ${decreaseAmount}`,
                    position: 'left',
                    offsetX: -10,
                    offsetY: -10
                }
            });
        }
    }

    var optionsjkg = {
        series: [
            {
                name: "Bidang Nasional",
                data: t_nasional
            },
            {
                name: "Bidang Lokal",
                data: t_lokal
            },
            {
                name: "Bidang Multinasional",
                data: t_multi
            },
            { name: "Target KPI Nasional", data: targetValuesNAS},
            { name: "Target KPI Lokal", data: targetValuesLOK},
            { name: "Target KPI Multinasional", data: targetValuesMUL}
        ],
        chart: {
            height: 350,
            type: 'line',
            dropShadow: {
                enabled: true,
                color: '#000',
                top: 18,
                left: 7,
                blur: 10,
                opacity: 0.2
            },
            zoom: {
                enabled: false
            },
            toolbar: {
                show: true
            }
        },
        colors: ['#77B6EA', '#FFB22C', '#34C38F', '#008FFB', '#FF4560', '#8B4513'],
        dataLabels: {
            enabled: true,
        },
        stroke: {
            curve: 'straight', 
            width: [3, 3, 3, 2, 2, 2], 
            dashArray: [0, 0, 0, 5, 5, 5]
        },
        title: {
            text: `Jangkauan Bidang Kerja Lulusan Prodi ${Prodi}`,
            align: 'left'
        },
        grid: {
            borderColor: '#e7e7e7',
            row: {
                colors: ['#f3f3f3', 'transparent'],
                opacity: 0.5
            },
            xaxis: {
                lines: {
                    show: true
                }
            },
            yaxis: {
                lines: {
                    show: true
                }
            }
        },
        markers: {
            size: 4,
            colors: ['#FFB22C', '#77B6EA', '#34C38F', '#008FFB', '#FF4560', '#8B4513'],
            strokeColor: '#fff',
            strokeWidth: 2
        },
        xaxis: {
            categories: tahun_lulusan3,
            title: {
                text: 'Tahun Lulus'
            }
        },
        yaxis: {
            title: {
                text: 'Lulusan Terlacak'
            },
            categories: [...new Set(jml_lacak3.sort((a, b) => a - b))],
            labels: {
                formatter: function (val) {
                    return val; // Menampilkan nilai asli
                }
            }
        },
        annotations: {
            points: [...anotasilokal, ...anotasinasional, ...anotasimulti] 
        },
        legend: {
            position: 'top',
            horizontalAlign: 'right',
            floating: true,
            offsetY: -25,
            offsetX: -5
        }
    };

    var chartjkg = new ApexCharts(document.querySelector("#jkg-chart"), optionsjkg);
    chartjkg.render();
</script>


<script>
    let Prodijgk2 = "<%= namaProdi %>";
    let kpiThresholds_63 = <%= threshold_63.Text %>;
    let targetValues_63 = [];
    tahun_lulusan3.sort(function(a, b) {
        return a - b;
    });

    // Prepare target KPI values
    for (let i = 0; i < tahun_lulusan3.length; i++) {
        const year = tahun_lulusan3[i];
        targetValues_63.push(kpiThresholds_63[year] || 0);
    }

    let anotasilulusanjgk = [];
    for (let i = 1; i < jml_lulus3.length; i++) {
        const targetkpiThresholds_63 = kpiThresholds_63[tahun_lulusan3[i]];

        if (targetkpiThresholds_63 && jml_lulus3[i] < targetkpiThresholds_63) {
            let decreaseAmount = targetkpiThresholds_63 - jml_lulus3[i];
            anotasilulusanjgk.push({
                x: tahun_lulusan3[i],  // Assuming the years are the same for newreg and newtrf
                y: jml_lulus3[i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                        background: '#FFFFFF',
                        borderRadius: '2px'
                    },
                    text: `Turun: ${decreaseAmount}`,
                    position: 'left',
                    offsetX: -10,
                    offsetY: -10
                }
            });
        }
    }

    let anotasilacakjgk = [];
    for (let i = 1; i < jml_lacak3.length; i++) {
        if (jml_lacak3[i] < jml_lacak3[i - 1]) {
            let decreaseAmount = (jml_lacak3[i - 1] - jml_lacak3[i]); // Round to 2 decimal places
            anotasilacakjgk.push({
                x: tahun_lulusan3[i],  // Assuming the years are the same for newreg and newtrf
                y: jml_lacak3[i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                        background: '#FFFFFF',
                        borderRadius: '2px'
                    },
                    text: `Turun: ${decreaseAmount}`,
                    position: 'left',
                    offsetX: -10,
                    offsetY: -10
                }
            });
        }
    }

    var options = {
        series: [
            {
                name: "Terlacak",
                data: jml_lacak3
            },
            {
                name: "Lulusan",
                data: jml_lulus3
            },
            { name: "Target KPI", data: targetValues_63}
        ],
        chart: {
            height: 350,
            type: 'line',
            dropShadow: {
                enabled: true,
                color: '#000',
                top: 18,
                left: 7,
                blur: 10,
                opacity: 0.2
            },
            zoom: {
                enabled: false
            },
            toolbar: {
                show: true
            }
        },
        colors: ['#77B6EA', '#FFB22C', '#008FFB'], // Added a color for the third variable
        dataLabels: {
            enabled: true,
        },
        stroke: {
            curve: 'straight', 
            width: [3, 3, 2], 
            dashArray: [0, 0, 5]
        },
        title: {
            text: `Jumlah Lulusan Prodi ${Prodijgk2}`,
            align: 'left'
        },
        grid: {
            borderColor: '#e7e7e7',
            row: {
                colors: ['#f3f3f3', 'transparent'],
                opacity: 0.5
            },
            xaxis: {
                lines: {
                    show: true
                }
            },
            yaxis: {
                lines: {
                    show: true
                }
            }
        },
        markers: {
            size: 4,
            colors: ['#FFB22C', '#77B6EA', '#008FFB'], // Added marker color for the third variable
            strokeColor: '#fff',
            strokeWidth: 2
        },
        xaxis: {
            categories: tahun_lulusan3,
            title: {
                text: 'Tahun Lulus'
            }
        },
        yaxis: {
            title: {
                text: 'Jumlah Lulusan'
            },
            labels: {
                formatter: function (val) {
                    return val; 
                }
            }
        },
        annotations: {
            points: [...anotasilulusanjgk, ...anotasilacakjgk] // Gabungkan anotasi
        },
        legend: {
            position: 'top',
            horizontalAlign: 'right',
            floating: true,
            offsetY: -25,
            offsetX: -5
        }
    };

    var lulusan_lacakan2 = new ApexCharts(document.querySelector("#lls2-chart"), options);
    lulusan_lacakan2.render();
</script>

<% Response.write("<script>let tahun_lulusan4 = " & tahun_lulusan4 & ";let jml_6bln = " & jml_6bln & ";let jml618bln = " & jml618bln & ";let jml_18bln = " & jml_18bln & "</script>") %>

<% Response.write("<script>let jml_lulus4 = " & jml_lulus4 & ";let jml_lacak4 = " & jml_lacak4 & "</script>") %>

<script>
    let Prodi2wt = "<%= namaProdi %>";
    let kpiThresholds_64 = <%= threshold_64.Text %>; 
    let targetValues_64 = [];
    tahun_lulusan4.sort(function(a, b) {
        return a - b;
    });

    // Prepare target KPI values
    for (let i = 0; i < tahun_lulusan4.length; i++) {
        const year = tahun_lulusan4[i];
        targetValues_64.push(kpiThresholds_64[year] || 0);
    }

    let anotasilulusanwt = [];
    for (let i = 0; i < jml_lulus4.length; i++) {
        const targetkpiThresholds_64 = kpiThresholds_64[tahun_lulusan4[i]];

        if (targetkpiThresholds_64 && jml_lulus4[i] < targetkpiThresholds_64) {
            let decreaseAmount = targetkpiThresholds_64 - jml_lulus4[i];
            anotasilulusanwt.push({
                x: tahun_lulusan4[i],  // Assuming the years are the same for newreg and newtrf
                y: jml_lulus4[i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                        background: '#FFFFFF',
                        borderRadius: '2px'
                    },
                    text: `Turun: ${decreaseAmount}`,
                    position: 'left',
                    offsetX: -10,
                    offsetY: -10
                }
            });
        }
    }

    let anotasilacakwt = [];
    for (let i = 1; i < jml_lacak4.length; i++) {
        if (jml_lacak4[i] < jml_lacak4[i - 1]) {
            let decreaseAmount = (jml_lacak4[i - 1] - jml_lacak4[i]); // Round to 2 decimal places
            anotasilacakwt.push({
                x: tahun_lulusan4[i],  // Assuming the years are the same for newreg and newtrf
                y: jml_lacak4[i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                        background: '#FFFFFF',
                        borderRadius: '2px'
                    },
                    text: `Turun: ${decreaseAmount}`,
                    position: 'left',
                    offsetX: -10,
                    offsetY: -10
                }
            });
        }
    }
    

    var options = {
        series: [
            {
                name: "Terlacak",
                data: jml_lacak4
            },
            {
                name: "Lulusan",
                data: jml_lulus4
            },
            { name: "Target KPI", data: targetValues_64}
        ],
        chart: {
            height: 350,
            type: 'line',
            dropShadow: {
                enabled: true,
                color: '#000',
                top: 18,
                left: 7,
                blur: 10,
                opacity: 0.2
            },
            zoom: {
                enabled: false
            },
            toolbar: {
                show: true
            }
        },
        colors: ['#77B6EA', '#FFB22C', '#008FFB'], // Added a color for the third variable
        dataLabels: {
            enabled: true,
        },
        stroke: {
            curve: 'straight', 
            width: [3, 3, 2], 
            dashArray: [0, 0, 5]
        },
        title: {
            text: `Jumlah Lulusan Prodi ${Prodi2wt}`,
            align: 'left'
        },
        grid: {
            borderColor: '#e7e7e7',
            row: {
                colors: ['#f3f3f3', 'transparent'],
                opacity: 0.5
            },
            xaxis: {
                lines: {
                    show: true
                }
            },
            yaxis: {
                lines: {
                    show: true
                }
            }
        },
        markers: {
            size: 4,
            colors: ['#FFB22C', '#77B6EA', '#008FFB'], // Added marker color for the third variable
            strokeColor: '#fff',
            strokeWidth: 2
        },
        xaxis: {
            categories: tahun_lulusan4,
            title: {
                text: 'Tahun Lulus'
            }
        },
        yaxis: {
            title: {
                text: 'Jumlah Lulusan'
            },
            labels: {
                formatter: function (val) {
                    return val; 
                }
            }
        },
        annotations: {
            points: [...anotasilulusanwt, ...anotasilacakwt] // Gabungkan anotasi
        },
        legend: {
            position: 'top',
            horizontalAlign: 'right',
            floating: true,
            offsetY: -25,
            offsetX: -5
        }
    };

    var lulusan_lacakan = new ApexCharts(document.querySelector("#llswt-chart"), options);
    lulusan_lacakan.render();
</script>

<script>
    let Prodiwt = "<%= namaProdi %>";
    let tahun_lulusan4_2 = <%= tahun_lulusan4 %>;
    let jml_6bln_2 = <%= jml_6bln %>;
    let jml618bln_2 = <%= jml618bln %>;
    let jml_18bln_2 = <%= jml_18bln %>;
    let jml_lacak_2 = <%= jml_lacak4 %>;
    let kpiThresholdsT06 = <%= thresholdT06.Text %>;
    let kpiThresholdsT18 = <%= thresholdT18.Text %>;
    let kpiThresholdsL18 = <%= thresholdL18.Text %>;
    let targetValuesT06 = []; 
    let targetValuesT18 = [];
    let targetValuesL18 = [];

    tahun_lulusan4_2.sort(function(a, b) {
        return a - b;
    });

    // Prepare target KPI values
    for (let i = 0; i < tahun_lulusan4_2.length; i++) {
        const year = tahun_lulusan4_2[i];
        targetValuesT06.push(kpiThresholdsT06[year] || 0);
        targetValuesT18.push(kpiThresholdsT18[year] || 0);
        targetValuesL18.push(kpiThresholdsL18[year] || 0);
    }

    let anotasi6bln_2 = [];
    for (let i = 0; i < jml_6bln_2.length; i++) {
        const targetkpiThresholdsT06 = kpiThresholdsT06[tahun_lulusan4_2[i]];

        if (targetkpiThresholdsT06 && jml_6bln_2[i] < targetkpiThresholdsT06) {
            let decreaseAmount_2 = targetkpiThresholdsT06 - jml_6bln_2[i];
            anotasi6bln_2.push({
                x: tahun_lulusan4_2[i],  // Assuming the years are the same for newreg and newtrf
                y: jml_6bln_2[i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                        background: '#FFFFFF',
                        borderRadius: '2px'
                    },
                    text: `Turun: ${decreaseAmount_2}`,
                    position: 'top',
                    offsetX: -15,
                    offsetY: -10
                }
            });
        }
    }

    let anotasi618bln_2 = [];
    for (let i = 0; i < jml618bln_2.length; i++) {
        const targetkpiThresholdsT18 = kpiThresholdsT18[tahun_lulusan4_2[i]];

        if (targetkpiThresholdsT18 && jml618bln_2[i] < targetkpiThresholdsT18) {
            let decreaseAmount_2 = targetkpiThresholdsT18 - jml618bln_2[i];
            anotasi618bln_2.push({
                x: tahun_lulusan4_2[i],  // Assuming the years are the same for newreg and newtrf
                y: jml618bln_2[i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                        background: '#FFFFFF',
                        borderRadius: '2px'
                    },
                    text: `Turun: ${decreaseAmount_2}`,
                    position: 'top',
                    offsetX: -15,
                    offsetY: -10
                }
            });
        }
    }

    let anotasi18bln_2 = [];
    for (let i = 0; i < jml_18bln_2.length; i++) {
        const targetkpiThresholdsL18 = kpiThresholdsL18[tahun_lulusan4_2[i]];

        if (targetkpiThresholdsL18 && jml_18bln_2[i] < targetkpiThresholdsL18) {
            let decreaseAmount_2 = targetkpiThresholdsL18 - jml_18bln_2[i];
            anotasi18bln_2.push({
                x: tahun_lulusan4_2[i],  // Assuming the years are the same for newreg and newtrf
                y: jml_18bln_2  [i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                        background: '#FFFFFF',
                        borderRadius: '2px'
                    },
                    text: `Turun: ${decreaseAmount_2}`,
                    position: 'top',
                    offsetX: -15,
                    offsetY: -10
                }
            });
        }
    }

    var optionsdm = {
        series: [
            {
                name: "WT 6 - 18 Bln",
                data: jml618bln_2
            },
            {
                name: "WT 6 Bln",
                data: jml_6bln_2
            },
            {
                name: "WT > 18 Bln",
                data: jml_18bln_2
            },
            { name: "Target WT 6 - 18 Bln", data: targetValuesT18},
            { name: "Target WT 6 Bln", data: targetValuesT06},
            { name: "Target WT > 18 Bln", data: targetValuesL18}
        ],
        chart: {
            height: 350,
            type: 'line',
            dropShadow: {
                enabled: true,
                color: '#000',
                top: 18,
                left: 7,
                blur: 10,
                opacity: 0.2
            },
            zoom: {
                enabled: false
            },
            toolbar: {
                show: true
            }
        },
        colors: ['#77B6EA', '#FFB22C', '#34C38F', '#008FFB', '#FF4560', '#8B4513'],
        dataLabels: {
            enabled: true,
        },
        stroke: {
            curve: 'straight', 
            width: [3, 3, 3, 2, 2, 2], 
            dashArray: [0, 0, 0, 5, 5, 5]
        },
        title: {
            text: `Waktu Tunggu Lulusan Prodi ${Prodiwt}`,
            align: 'left'
        },
        grid: {
            borderColor: '#e7e7e7',
            row: {
                colors: ['#f3f3f3', 'transparent'],
                opacity: 0.5
            },
            xaxis: {
                lines: {
                    show: true
                }
            },
            yaxis: {
                lines: {
                    show: true
                }
            }
        },
        markers: {
            size: 4,
            colors: ['#FFB22C', '#77B6EA', '#34C38F', '#008FFB', '#FF4560', '#8B4513'],
            strokeColor: '#fff',
            strokeWidth: 2
        },
        xaxis: {
            categories: tahun_lulusan4_2,
            title: {
                text: 'Tahun Lulus'
            }
        },
        yaxis: {
            title: {
                text: 'Jumlah Terlacak'
            },
            categories: [...new Set(jml_lacak_2.sort((a, b) => a - b))], // Urutkan nilai unik pada jml_lacak_2
            labels: {
                formatter: function (val) {
                    return val; // Menampilkan nilai asli
                }
            }
        },
        annotations: {
            points: [...anotasi6bln_2, ...anotasi618bln_2, ...anotasi18bln_2] 
        },
        legend: {
            position: 'top',
            horizontalAlign: 'right',
            floating: true,
            offsetY: -25,
            offsetX: -5
        }
    };

    var chartdm = new ApexCharts(document.querySelector("#wt-chart"), optionsdm);
    chartdm.render();

</script>

<% Response.write("<script>let tahun_ang = " & tahun_ang & ";let jml_terima = " & jml_terima & ";let jml_lulus5 = " & jml_lulus5 & "</script>") %>

<script>
    let Prodi56 = "<%= namaProdi %>";
    let kpiThresholdsJDT = <%= thresholdJDT.Text %>;
    let kpiThresholdsJLL = <%= thresholdJLL.Text %>;
    let targetValuesJDT = []; 
    let targetValuesJLL = [];
    tahun_ang.sort(function(a, b) {
        return a - b;
    });

    // Prepare target KPI values
    for (let i = 0; i < tahun_ang.length; i++) {
        const year = tahun_ang[i];
        targetValuesJDT.push(kpiThresholdsJDT[year] || 0);
        targetValuesJLL.push(kpiThresholdsJLL[year] || 0);
    }

    let anotasiterima = [];
    for (let i = 0; i < jml_terima.length; i++) {
        const targetkpiThresholdsJDT = kpiThresholdsJDT[tahun_ang[i]];

        if (targetkpiThresholdsJDT && jml_terima[i] < targetkpiThresholdsJDT) {
            let decreaseAmount = targetkpiThresholdsJDT - jml_terima[i];
            anotasiterima.push({
                x: tahun_ang[i],  // Assuming the years are the same for newreg and newtrf
                y: jml_terima[i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                        background: '#FFFFFF',
                        borderRadius: '2px'
                    },
                    text: `Turun: ${decreaseAmount}`,
                    position: 'top',
                    offsetX: 0,
                    offsetY: -20
                }
            });
        }
    }

    let anotasilulus = [];
    for (let i = 0; i < jml_lulus5.length; i++) {
        const targetkpiThresholdsJLL = kpiThresholdsJLL[tahun_ang[i]];

        if (targetkpiThresholdsJLL && jml_lulus5[i] < targetkpiThresholdsJLL) {
            let decreaseAmount = targetkpiThresholdsJLL - jml_lulus5[i];
            anotasilulus.push({
                x: tahun_ang[i],  // Assuming the years are the same for newreg and newtrf
                y: jml_lulus5[i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                        background: '#FFFFFF',
                        borderRadius: '2px'
                    },
                    text: `Turun: ${decreaseAmount}`,
                    position: 'top',
                    offsetX: 0,
                    offsetY: -20
                }
            });
        }
    }

    console.log("jml_terima:", jml_terima);
    console.log("jml_lulus5:", jml_lulus5);
    console.log("tahun_ang:", tahun_ang);
    console.log("kpiThresholdsJDT:", kpiThresholdsJDT);
    console.log("kpiThresholdsJLL:", kpiThresholdsJLL);


    var options = {
        series: [
            {
                name: "Jumlah Mahasiswa Diterima",
                data: jml_terima
            },
            {
                name: "Jumlah Mahasiswa Lulus",
                data: jml_lulus5
            },
            { name: "Target Mhs. Diterima", data: targetValuesJDT},
            { name: "Target Mhs. Lulus", data: targetValuesJLL}
        ],
        chart: {
            height: 350,
            type: 'line',
            dropShadow: {
                enabled: true,
                color: '#000',
                top: 18,
                left: 7,
                blur: 10,
                opacity: 0.2
            },
            zoom: {
                enabled: false
            },
            toolbar: {
                show: true
            }
        },
        colors: ['#77B6EA', '#FFB22C', '#008FFB', '#FF4560'], // Added a color for the third variable
        dataLabels: {
            enabled: true,
        },
        stroke: {
            curve: 'straight', 
            width: [3, 3, 2, 2], 
            dashArray: [0, 0, 5, 5]
        },
        title: {
            text: `Jumlah Mahasiswa Diterima - Lulus Per-angkatan Prodi ${Prodi56}`,
            align: 'left'
        },
        grid: {
            borderColor: '#e7e7e7',
            row: {
                colors: ['#f3f3f3', 'transparent'],
                opacity: 0.5
            },
            xaxis: {
                lines: {
                    show: true
                }
            },
            yaxis: {
                lines: {
                    show: true
                }
            }
        },
        markers: {
            size: 4,
            colors: ['#FFB22C', '#77B6EA', '#008FFB', '#FF4560'], // Added marker color for the third variable
            strokeColor: '#fff',
            strokeWidth: 2
        },
        xaxis: {
            categories: tahun_ang,
            title: {
                text: 'Tahun Angkatan'
            }
        },
        yaxis: {
            title: {
                text: 'Jumlah Mahasiswa'
            },
            labels: {
                formatter: function (val) {
                    return val; 
                }
            }
        },
        annotations: {
            points: [...anotasiterima, ...anotasilulus],
            position: 'front',
            debug: true
        },
        legend: {
            position: 'top',
            horizontalAlign: 'right',
            floating: true,
            offsetY: -25,
            offsetX: -5
        }
    };

    var chart = new ApexCharts(document.querySelector("#tpt-chart"), options);
    chart.render();
</script>

<% Response.write("<script>let tahuncalon = " & tahuncalon & ";let calonpen_mhs = " & calonpen_mhs & ";let calonlulus_mhs = " & calonlulus_mhs & "</script>") %>

<script>
    let Prodicln = "<%= namaProdi %>";
    let kpiThresholdsCLN = <%= thresholdCLN.Text %>;
    let kpiThresholdsLLS = <%= thresholdLLS.Text %>;
    let targetValuesCLN = []; 
    let targetValuesLLS = [];
    tahuncalon.sort(function(a, b) {
        return a - b;
    });

    // Prepare target KPI values
    for (let i = 0; i < tahuncalon.length; i++) {
        const year = tahuncalon[i];
        targetValuesCLN.push(kpiThresholdsCLN[year] || 0);
        targetValuesLLS.push(kpiThresholdsLLS[year] || 0);
    }

    let decreaseAnnotations = [];
    for (let i = 0; i < calonlulus_mhs.length; i++) {
        const targetThresholdCLN = kpiThresholdsCLN[tahuncalon[i]];

        if (targetThresholdCLN && calonlulus_mhs[i] < targetThresholdCLN) {
            let decreaseAmount = targetThresholdCLN - calonlulus_mhs[i];
            decreaseAnnotations.push({
                x: tahuncalon[i],
                y: calonlulus_mhs[i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                    },
                    text: `Turun: ${decreaseAmount}`,
                    position: 'left',  // Ensure the annotation doesn't overlap with the chart edge
                    offsetX: -10,      // Add horizontal offset to prevent it from being clipped
                    offsetY: -10       // Add vertical offset for better visibility
                }
            });
        }
    }


    var options = {
        series: [
            {
                name: "Mahasiswa Lulus Seleksi",
                data: calonlulus_mhs
            },
            {
                name: "Pendaftar",
                data: calonpen_mhs
            },
            { name: "Target Mhs. Calon", data: targetValuesCLN},
            { name: "Target Mhs. lls Seleksi", data: targetValuesLLS}
        ],
        chart: {
            height: 350,
            type: 'line',
            dropShadow: {
                enabled: true,
                color: '#000',
                top: 18,
                left: 7,
                blur: 10,
                opacity: 0.2
            },
            zoom: {
                enabled: false
            },
            toolbar: {
                show: true
            }
        },
        colors: ['#77B6EA', '#FFB22C', '#008FFB', '#FF4560'],
        dataLabels: {
            enabled: true,
        },
        stroke: {
            curve: 'straight', 
            width: [3, 3, 2, 2], 
            dashArray: [0, 0, 5, 5]
        },
        title: {
            text: `Jumlah Calon Mahasiswa Prodi ${Prodicln}`,
            align: 'left'
        },
        grid: {
            borderColor: '#e7e7e7',
            row: {
                colors: ['#f3f3f3', 'transparent'],
                opacity: 0.5
            },
            padding: {
                left: 30,  // Add padding to the left and right for better annotation visibility
                right: 30,
                top: 20,
                bottom: 20
            },
            xaxis: {
                lines: {
                    show: true
                }
            },
            yaxis: {
                lines: {
                    show: true
                }
            }
        },
        markers: {
            size: 4,
            colors: ['#FFB22C', '#77B6EA', '#008FFB', '#FF4560'],
            strokeColor: '#fff',
            strokeWidth: 2
        },
        xaxis: {
            categories: tahuncalon,
            title: {
                text: 'Tahun Akademik'
            }
        },
        yaxis: {
            title: {
                text: 'Jumlah'
            },
            labels: {
                formatter: function (val) {
                    return val.toFixed(0);
                }
            }
        },
        legend: {
            position: 'top',
            horizontalAlign: 'right',
            floating: true,
            offsetY: -25,
            offsetX: -5
        },
        annotations: {
            points: decreaseAnnotations  // Include annotations
        }
    };

    var chart = new ApexCharts(document.querySelector("#calon-chart"), options);
    chart.render();
</script>

<% Response.write("<script>let tahunnew = " & tahunnew & ";let newreg_mhs = " & newreg_mhs & ";let newtrf_mhs = " & newtrf_mhs & "</script>") %>

<script>
    let Prodinew = "<%= namaProdi %>";
    let kpiThresholdsREG_1 = <%= thresholdREG_1.Text %>;
    let kpiThresholdsTRF_1 = <%= thresholdTRF_1.Text %>;
    let targetValuesREG_1 = []; 
    let targetValuesTRF_1 = [];
    tahunnew.sort(function(a, b) {
        return a - b;
    });

    // Prepare target KPI values
    for (let i = 0; i < tahunnew.length; i++) {
        const year = tahunnew[i];
        targetValuesREG_1.push(kpiThresholdsREG_1[year] || 0);
        targetValuesTRF_1.push(kpiThresholdsTRF_1[year] || 0);
    }

    let decreaseAnnotations1 = [];
    for (let i = 0; i < newreg_mhs.length; i++) {
        const targetkpiThresholdsREG_1 = kpiThresholdsREG_1[tahunnew[i]];

        if (targetkpiThresholdsREG_1 && newreg_mhs[i] < targetkpiThresholdsREG_1) {
            let decreaseAmount = targetkpiThresholdsREG_1 - newreg_mhs[i];
            decreaseAnnotations1.push({
                x: tahunnew[i],
                y: newreg_mhs[i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                        background: '#FFFFFF',
                        borderRadius: '2px'
                    },
                    text: `Turun: ${decreaseAmount}`,
                    position: 'left',
                    offsetX: -10,
                    offsetY: -10
                }
            });
        }
    }

    let decreaseAnnotations2 = [];
    for (let i = 0; i < newtrf_mhs.length; i++) {
        const targetkpiThresholdsTRF_1 = kpiThresholdsTRF_1[tahunnew[i]];

        if (targetkpiThresholdsTRF_1 && newtrf_mhs[i] < targetkpiThresholdsTRF_1) {
            let decreaseAmount = targetkpiThresholdsTRF_1 - newtrf_mhs[i];
            decreaseAnnotations2.push({
                x: tahunnew[i],  // Assuming the years are the same for newreg and newtrf
                y: newtrf_mhs[i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                        background: '#FFFFFF',
                        borderRadius: '2px'
                    },
                    text: `Turun: ${decreaseAmount}`,
                    position: 'left',
                    offsetX: -10,
                    offsetY: -10
                }
            });
        }
    }

    var options = {
        series: [
            {
                name: "Mahasiswa Baru Reguler", 
                data: newreg_mhs
            },
            {
                name: "Mahasiswa Baru Transfer", 
                data: newtrf_mhs
            },
            { name: "Target Mhs. Reg", data: targetValuesREG_1},
            { name: "Target Mhs. Trf", data: targetValuesTRF_1}
        ],
        chart: {
            height: 350,
            type: 'line',
            dropShadow: {
                enabled: true,
                color: '#000',
                top: 18,
                left: 7,
                blur: 10,
                opacity: 0.2
            },
            zoom: {
                enabled: false
            },
            toolbar: {
                show: true
            }
        },
        colors: ['#77B6EA', '#FFB22C', '#008FFB', '#FF4560'],
        dataLabels: {
            enabled: true,
        },
        stroke: {
            curve: 'straight', 
            width: [3, 3, 2, 2], 
            dashArray: [0, 0, 5, 5]
        },
        title: {
            text: `Jumlah Mahasiswa Baru ${Prodinew}`,
            align: 'left'
        },
        grid: {
            borderColor: '#e7e7e7',
            row: {
                colors: ['#f3f3f3', 'transparent'],
                opacity: 0.5
            },
            padding: {
                left: 30,  // Add padding to the left and right for better annotation visibility
                right: 30,
                top: 20,
                bottom: 20
            },
            xaxis: {
                lines: {
                    show: true
                }
            },
            yaxis: {
                lines: {
                    show: true
                }
            }
        },
        markers: {
            size: 4,
            colors: ['#77B6EA', '#C7253E', '#008FFB', '#FF4560'],
            strokeColor: '#fff',
            strokeWidth: 2
        },
        xaxis: {
            categories: tahunnew,
            title: {
                text: 'Tahun Akademik'
            }
        },
        yaxis: {
            title: {
                text: 'Jumlah'
            },
            labels: {
                formatter: function (val) {
                    return val.toFixed(0);
                }
            }
        },
        legend: {
            position: 'top',
            horizontalAlign: 'right',
            floating: true,
            offsetY: -25,
            offsetX: -5
        },
        annotations: {
            points: [...decreaseAnnotations1, ...decreaseAnnotations2]
        }
    };

    var chart = new ApexCharts(document.querySelector("#new-chart"), options);
    chart.render();
</script>

<% Response.write("<script>let tahunaktif = " & tahunaktif & ";let aktifreg_mhs = " & aktifreg_mhs & ";let aktiftrf_mhs = " & aktiftrf_mhs & "</script>") %>

<script>
    let Prodi3 = "<%= namaProdi %>";
    let kpiThresholdsREG_2 = <%= thresholdREG_2.Text %>;
    let kpiThresholdsTRF_2 = <%= thresholdTRF_2.Text %>;
    let targetValuesREG_2 = []; 
    let targetValuesTRF_2 = [];
    tahunaktif.sort(function(a, b) {
        return a - b;
    });

    // Prepare target KPI values
    for (let i = 0; i < tahunaktif.length; i++) {
        const year = tahunaktif[i];
        targetValuesREG_2.push(kpiThresholdsREG_2[year] || 0);
        targetValuesTRF_2.push(kpiThresholdsTRF_2[year] || 0);
    }

    let decreaseAnnotations3 = [];
    for (let i = 0; i < aktifreg_mhs.length; i++) {
        const targetkpiThresholdsREG_2 = kpiThresholdsREG_2[tahunaktif[i]];

        if (targetkpiThresholdsREG_2 && aktifreg_mhs[i] < targetkpiThresholdsREG_2) {
            let decreaseAmount = targetkpiThresholdsREG_2 - aktifreg_mhs[i];
        
            decreaseAnnotations3.push({
                x: tahunaktif[i],
                y: aktifreg_mhs[i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                        background: '#FFFFFF',
                        borderRadius: '2px'
                    },
                    text: `Turun: ${decreaseAmount}`,
                    position: 'left',
                    offsetX: -10,
                    offsetY: -10
                }
            });
        }
    }

    let decreaseAnnotations4 = [];
    for (let i = 0; i < aktiftrf_mhs.length; i++) {
        const targetkpiThresholdsTRF_2 = kpiThresholdsTRF_2[tahunaktif[i]];

        if (targetkpiThresholdsTRF_2 && aktiftrf_mhs[i] < targetkpiThresholdsTRF_2) {
            let decreaseAmount = targetkpiThresholdsTRF_2 - aktiftrf_mhs[i];
            decreaseAnnotations4.push({
                x: tahunaktif[i],  // Assuming the years are the same for newreg and newtrf
                y: aktiftrf_mhs[i],
                label: {
                    borderColor: '#FF0000',
                    style: {
                        fontSize: '12px',
                        color: '#FF0000',
                        background: '#FFFFFF',
                        borderRadius: '2px'
                    },
                    text: `Turun: ${decreaseAmount}`,
                    position: 'left',
                    offsetX: -10,
                    offsetY: -10
                }
            });
        }
    }

    var options = {
        series: [
            {
                name: "Mahasiswa Aktif Reguler",
                data: aktifreg_mhs
            },
            {
                name: "Mahasiswa Aktif Transfer",
                data: aktiftrf_mhs 
            },
            { name: "Target Mhs. Reg", data: targetValuesREG_2},
            { name: "Target Mhs. Trf", data: targetValuesTRF_2}
        ],
        chart: {
            height: 350,
            type: 'line',
            zoom: {
                enabled: false
            }
        },
        dataLabels: {
            enabled: false
        },
        stroke: {
            curve: 'straight', 
            width: [3, 3, 2, 2], 
            dashArray: [0, 0, 5, 5]
        },
        title: {
            text: `Jumlah Mahasiswa Aktif ${Prodi3}`,
            align: 'left'
        },
        grid: {
            borderColor: '#e7e7e7',
            strokeDashArray: 0, // Garis grid solid
            row: {
                colors: ['#f3f3f3', 'transparent'], // Warna grid baris
                opacity: 0.5
            },
            xaxis: {
                lines: {
                    show: true // Tampilkan garis grid vertikal
                }
            },
            yaxis: {
                lines: {
                    show: true // Tampilkan garis grid horizontal
                }
            }
        },
        xaxis: {
            categories: tahunaktif,
            title: {
                text: 'Tahun Akademik'
            }
        },
        yaxis: {
            title: {
                text: 'Jumlah'
            },
            labels: {
                formatter: function (val) {
                    return val.toFixed(0); // Format label y-axis untuk menghindari desimal
                }
            }
        },
        markers: {
            size: 6, // Ukuran titik
            colors: ['#3FA2F6', '#00E396', '#008FFB', '#FF4560'], // Warna titik sesuai dengan warna garis
            strokeColor: '#fff', // Warna garis tepi titik
            strokeWidth: 2, // Ketebalan garis tepi titik
            hover: {
                size: 8, // Ukuran titik saat hover
                sizeOffset: 3 // Offset ukuran saat hover
            }
        },
        annotations: {
            points: [...decreaseAnnotations3, ...decreaseAnnotations4] // Gabungkan anotasi
        }
    };

    var chart = new ApexCharts(document.querySelector("#aktif-chart"), options);
    chart.render();

    
</script>
