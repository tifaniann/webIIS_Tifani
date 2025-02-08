<!-- #INCLUDE file ="con_ascx2022/conlintar2022.ascx" -->
<script runat="server">
	Dim name
	Sub page_load(o As Object, e As EventArgs)
		cekauthlintar()
		If Not Page.IsPostBack Then
			'getusername()
		End If
	End Sub

	Function getusername()
		qry = "SELECT nama FROM tkarya WHERE nikgabung='" & Session("idlintar") & "'"
		isidata(qry, "rsusername")
		tutup()
		name = dtlist.Rows(0)(0)
		dtlist.Clear()
	End Function
</script>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		 <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<title>Halaman Utama</title>

		<!-- Google font -->
		<link href="https://fonts.googleapis.com/css?family=Lato:700%7CMontserrat:400,600" rel="stylesheet">

		<!-- Bootstrap -->
		<link type="text/css" rel="stylesheet" href="assetsnewlintar/css/bootstrap.min.css"/>

		<!-- Font Awesome Icon -->
		<link rel="stylesheet" href="assetsnewlintar/css/font-awesome.min.css">

		<!-- Custom stlylesheet -->
		<link type="text/css" rel="stylesheet" href="assetsnewlintar/css/style.css"/>
		<link rel="stylesheet" href="assetsnewlintar/owlcarousel/assets/owl.carousel.min.css">
		<link rel="stylesheet" href="assetsnewlintar/owlcarousel/assets/owl.theme.default.min.css">
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
		
		
    </head>
	<body>

	<!-- Header -->
	<header id="header" class="transparent-nav" style="background-image:url(assetsnewlintar/img/back5.jpg)">
		<div class="container">
			<div class="col-md-6">
				<div class="navbar-header" >
					<div class="navbar-brand">
						<a class="logo" href="#">
							<img src="assetsnewlintar/img/toplogo.png" alt="logo" style="height:40px;margin:5px;">
						</a>
					</div>
				</div>
			</div>
			<div class="col-md-6">
					<a class="logo" href="#">
						<img src="assetsnewlintar/img/logorecognisi.png" alt="logo" style="height:40px;margin:10px;">
					</a>
			</div>
		</div>
	</header>
		

	<div id="courses" class="section">
		<div class="container">

		<!-- courses -->
		<div id="courses-wrapper">
			
			
			<% Response.Write("<h3>Selamat Datang, <span style='color:#991f1f;'>" & Session("nama_lintar") & "</span></h3>") %>
			<hr>
			
			<!-- row -->
			<div class="row">
			
			</div>
		</div>
	</div>
		<!-- container -->
		<div class="container">

			<!-- courses -->
			<div id="courses-wrapper">
				<!-- row -->
				<div class="row">
					<div class="col-md-1">
						<div class="course">
							<a href="utama.aspx" class="course-img">
								<img src="assetsnewlintar/icon/Asset 462.png" alt="">
								<i class=""></i>
							</a>
							<a class="course-title" href="utama.aspx" style="text-align:center;">Halaman Utama</a>
						</div>
					</div>
					
					<div class="col-md-1">
						<div class="course">
							<a href="/exchangeprogram/index.aspx" class="course-img">
								<img src="assetsnewlintar/icon/Asset 451.png" alt="">
								<i class=""></i>
							</a>
							<a class="course-title" href="/exchangeprogram/index.aspx" style="text-align:center;">Exchange Program</a>
						</div>
					</div>
					
					<div class="col-md-1">
						<div class="course">
							<a href="/lsidb_lintar/index.aspx" class="course-img">
								<img src="assetsnewlintar/icon/Asset 47.png" alt="">
								<i class=""></i>
							</a>
							<a class="course-title" href="/lsidb_lintar/index.aspx" style="text-align:center;">Lintar Admin</a>
							
						</div>
					</div>
					
					<div class="col-md-1">
						<div class="course">
							<a href="/monitoring_tunggakan/index.aspx" class="course-img">
								<img src="assetsnewlintar/icon/Asset 448.png" alt="">
								<i class=""></i>
							</a>
							<a class="course-title" href="/monitoring_tunggakan/index.aspx" style="text-align:center;">Monitoring Tunggakan</a>
							
						</div>
					</div>
					
					<div class="col-md-1">
						<div class="course">
							<a href="/siakad/index.aspx" class="course-img">
								<img src="assetsnewlintar/icon/Asset 467.png" alt="">
								<i class=""></i>
							</a>
							<a class="course-title" href="/siakad/index.aspx" style="text-align:center;">Sistem Akademik</a>
							
						</div>
					</div>
					
					<div class="col-md-1">
						<div class="course">
							<a href="/perkuliahan/index.aspx" class="course-img">
								<img src="assetsnewlintar/icon/Asset 458.png" alt="">
								<i class=""></i>
							</a>
							<a class="course-title" href="/perkuliahan/index.aspx" style="text-align:center;">Perkuliahan</a>
							
						</div>
					</div>
					
					<div class="col-md-1">
						<div class="course">
							<a href="/mbkm/index.aspx" class="course-img">
								<img src="assetsnewlintar/icon/Asset 457.png" alt="">
								<i class=""></i>
							</a>
							<a class="course-title" href="/mbkm/index.aspx" style="text-align:center;">MBKM</a>
							
						</div>
					</div>
					
					
					<div class="col-md-1">
						<div class="course">
							<a href="/monitorruangkuliah/index.aspx" class="course-img">
								<img src="assetsnewlintar/icon/Asset 445.png" alt="">
								<i class=""></i>
							</a>
							<a class="course-title" href="/monitorruangkuliah/index.aspx" style="text-align:center;">Pengelolaan Ruang</a>
							
						</div>
					</div>
					
					<div class="col-md-1">
						<div class="course">
							<a href="/ews_akreditasi/index.aspx" class="course-img">
								<img src="assetsnewlintar/icon/Asset 411.png" alt="">
								<i class=""></i>
							</a>
							<a class="course-title" href="/ews_akreditasi/index.aspx" style="text-align:center;">EWS Akreditasi</a>
							
						</div>
					</div>
					
					<div class="col-md-1">
						<div class="course">
							<a href="/yudisium/index.aspx" class="course-img">
								<img src="assetsnewlintar/icon/Asset 11.png" alt="">
								<i class=""></i>
							</a>
							<a class="course-title" href="/yudisium/index.aspx" style="text-align:center;">Yudisium</a>
							
						</div>
					</div>
					
					<div class="col-md-1">
						<div class="course">
							<a href="/kerjasama/index.aspx" class="course-img">
								<img src="assetsnewlintar/icon/Asset 53.png" alt="">
								<i class=""></i>
							</a>
							<a class="course-title" href="/kerjasama/index.aspx" style="text-align:center;">Kerjasama</a>
							
						</div>
					</div>
					
					<div class="col-md-1">
						<div class="course">
							<a href="/e_sertifikat/index.aspx" class="course-img">
								<img src="assetsnewlintar/icon/Asset 58.png" alt="">
								<i class=""></i>
							</a>
							<a class="course-title" href="/e_sertifikat/index.aspx" style="text-align:center;">Kegiatan Seminar</a>
							
						</div>
					</div>
					
				</div>
				<!-- /row -->

				<div class="row">

					<div class="col-md-1">
						<div class="course">
							<a href="/lppm_penelitian/index.aspx" class="course-img">
								<img src="assetsnewlintar/icon/Asset 28.png" alt="">
								<i class=""></i>
							</a>
							<a class="course-title" href="/lppm_penelitian/index.aspx" style="text-align:center;">Penelitian Online</a>
						</div>
					</div>

					<div class="col-md-1">
						<div class="course">
							<a href="/lppm_pkmdosen/index.aspx" class="course-img">
								<img src="assetsnewlintar/icon/Asset 27.png" alt="">
								<i class=""></i>
							</a>
							<a class="course-title" href="/lppm_pkmdosen/index.aspx" style="text-align:center;">PKM Dosen</a>
						</div>
					</div>

					<div class="col-md-1">
						<div class="course">
							<a href="/template3/index.aspx" class="course-img">
								<img src="assetsnewlintar/icon/Asset 52.png" alt="">
								<i class=""></i>
							</a>
							<a class="course-title" href="/template3/index.aspx" style="text-align:center;">Template 3</a>
						</div>
					</div>

					<div class="col-md-1">
						<div class="course">
							<a href="/ltrdosen_baru/index.aspx" class="course-img">
								<img src="assetsnewlintar/icon/Asset 29.png" alt="">
								<i class=""></i>
							</a>
							<a class="course-title" href="/ltrdosen_baru/index.aspx" style="text-align:center;">Lintar Dosen</a>
						</div>
					</div>
					
					<div class="col-md-1">
						<div class="course">
							<a href="/ltrdosen/index.aspx" class="course-img">
								<img src="assetsnewlintar/icon/Asset 29.png" alt="">
								<i class=""></i>
							</a>
							<a class="course-title" href="/ltrdosen/index.aspx" style="text-align:center;">Lintar Dosen 2</a>
						</div>
					</div>

					<div class="col-md-1">
						<div class="course">
							<a href="/ltrmahasiswa/index.aspx" class="course-img">
								<img src="assetsnewlintar/icon/Asset 30.png" alt="">
								<i class=""></i>
							</a>
							<a class="course-title" href="/ltrmahasiswa/index.aspx" style="text-align:center;">Lintar Mahasiswa</a>
						</div>
					</div>

					<div class="col-md-1">
						<div class="course">
							<a href="/lemawa_siklpj/index.aspx" class="course-img">
								<img src="assetsnewlintar/icon/Asset 39.png" alt="">
								<i class=""></i>
							</a>
							<a class="course-title" href="/lemawa_siklpj/index.aspx" style="text-align:center;">Lemawa SIK-LPJ</a>
						</div>
					</div>

					<div class="col-md-1">
						<div class="course">
							<a href="/lemawa_belmawadikti/index.aspx" class="course-img">
								<img src="assetsnewlintar/icon/Asset 2.png" alt="">
								<i class=""></i>
							</a>
							<a class="course-title" href="/lemawa_belmawadikti/index.aspx" style="text-align:center;">Lemawa Belmawa Dikti</a>
						</div>
					</div>

					<div class="col-md-1">
						<div class="course">
							<a href="/lemawa_beasiswa/index.aspx" class="course-img">
								<img src="assetsnewlintar/icon/Asset 409.png" alt="">
								<i class=""></i>
							</a>
							<a class="course-title" href="/lemawa_beasiswa/index.aspx" style="text-align:center;">Lemawa Beasiswa</a>
						</div>
					</div>

					<div class="col-md-1">
						<div class="course">
							<a href="/go_untar/index.aspx" class="course-img">
								<img src="assetsnewlintar/icon/Asset 423.png" alt="">
								<i class=""></i>
							</a>
							<a class="course-title" href="/go_untar/index.aspx" style="text-align:center;">Go Untar</a>
						</div>
					</div>

					<div class="col-md-1">
						<div class="course">
							<a href="/pradikti/index.aspx" class="course-img">
								<img src="assetsnewlintar/icon/Asset 424.png" alt="">
								<i class=""></i>
							</a>
							<a class="course-title" href="/pradikti/index.aspx" style="text-align:center;">Pradikti</a>
						</div>
					</div>

					<div class="col-md-1">
						<div class="course">
							<a href="/pengumuman/index.aspx" class="course-img">
								<img src="assetsnewlintar/icon/Asset 63.png" alt="">
								<i class=""></i>
							</a>
							<a class="course-title" href="pengumuman/index.aspx" style="text-align:center;">Pengumuman</a>
						</div>
					</div>
				</div>
				<!-- /row -->
				
				<div class="row">
					<div class="col-md-1">
						<div class="course">
							<a href="/lembel_rps/index.aspx" class="course-img">
								<img src="assetsnewlintar/icon/Asset 476.png" alt="">
								<i class=""></i>
							</a>
							<a class="course-title" href="/lembel_rps/index.aspx" style="text-align:center;">RPS</a>
						</div>
					</div>

					<div class="col-md-1">
						<div class="course">
							<a href="/tracer_study/index.aspx" class="course-img">
								<img src="assetsnewlintar/icon/Asset 461.png" alt="">
								<i class=""></i>
							</a>
							<a class="course-title" href="tracer_study/index.aspx" style="text-align:center;">Tracer Study</a>
						</div>
					</div>

					<div class="col-md-1">
						<div class="course">
							<a href="/lemutu_ppepp/index.aspx" class="course-img">
								<img src="assetsnewlintar/icon/Asset 479.png" alt="">
								<i class=""></i>
							</a>
							<a class="course-title" href="/lemutu_ppepp/index.aspx" style="text-align:center;">PPEPP</a>
						</div>
					</div>

					<div class="col-md-1">
						<div class="course">
							<a href="/rekamankegiatan/index.aspx" class="course-img">
								<img src="assetsnewlintar/icon/Asset 478.png" alt="">
								<i class=""></i>
							</a>
							<a class="course-title" href="/rekamankegiatan/index.aspx" style="text-align:center;">Rekaman Kegiatan</a>
						</div>
					</div>

					<div class="col-md-1">
						<div class="course">
							<a href="/ltrorangtua/index.aspx" class="course-img">
								<img src="assetsnewlintar/icon/Asset 11.png" alt="">
								<i class=""></i>
							</a>
							<a class="course-title" href="/ltrorangtua/index.aspx" style="text-align:center;">Lintar Orang Tua</a>
						</div>
					</div>

					<div class="col-md-1">
						<div class="course">
							<a href="/portofolio_prodi/index.aspx" class="course-img">
								<img src="assetsnewlintar/icon/Asset 411.png" alt="">
								<i class=""></i>
							</a>
							<a class="course-title" href="/portofolio_prodi/index.aspx" style="text-align:center;">Portofolio Prodi</a>
							
						</div>
					</div>

					<div class="col-md-1">
						<div class="course">
							<a href="/alumni_baru/index.aspx" class="course-img">
								<img src="assetsnewlintar/icon/Asset 411.png" alt="">
								<i class=""></i>
							</a>
							<a class="course-title" href="/alumni_baru/index.aspx" style="text-align:center;">Tracer Study Alumni</a>
							
						</div>
					</div>

					<div class="col-md-1">
						<div class="course">
							<a href="/programlintar/index.aspx" class="course-img">
								<img src="assetsnewlintar/icon/Asset 412.png" alt="">
								<i class=""></i>
							</a>
							<a class="course-title" href="/programlintar/index.aspx" style="text-align:center;">Program Lintar</a>
							
						</div>
					</div>

					<div class="col-md-1">
						<div class="course">
							<a href="/dashboard/index_dashboard.aspx" class="course-img">
								<img src="assetsnewlintar/icon/Asset 424.png" alt="">
								<i class=""></i>
							</a>
							<a class="course-title" href="/dashboard/index_dashboard.aspx" style="text-align:center;">Dashboard Kemahasiswaan</a>
						</div>
					</div>

					<div class="col-md-1">
						<div class="course">
							<a href="logout.aspx" class="course-img">
								<img src="assetsnewlintar/icon/Asset 59.png" alt="">
								<i class=""></i>
							</a>
							<a class="course-title" href="logout.aspx" style="text-align:center;">LogOut</a>
						</div>
					</div>

					
				</div>

			</div>
			<!-- /courses -->
		</div>
		<!-- container -->
	</div>
	<!-- /Courses -->

	<!-- Footer -->
	<footer id="footer" class="section">

		<!-- container -->
		<div class="container">

			<!-- row -->
			<div class="row">

				<!-- footer logo -->
				<div class="col-md-6">
					<div class="footer-logo">
						<a class="logo" href="index.html">
							<img src="assetsnewlintar/img/logo_id.png" alt="logo">
						</a>
					</div>
				</div>
				<!-- footer logo -->

				<!-- footer nav -->
				<div class="col-md-6">
					
				</div>
				<!-- /footer nav -->

			</div>
			<!-- /row -->

			<!-- row -->
			<div id="bottom-footer" class="row">

				<!-- social -->
				<div class="col-md-4 col-md-push-8">
					<ul class="footer-social">
						<li><a href="https://www.facebook.com/untarjakarta/" class="facebook"><i class="fa fa-facebook"></i></a></li>
						<li><a href="https://twitter.com/untarjakarta?s=21&t=rb4gLX4IFL0qbzcgGQzf6w" class="twitter"><i class="fa fa-twitter"></i></a></li>
						<li><a href="https://instagram.com/untarjakarta?igshid=YmMyMTA2M2Y=" class="instagram"><i class="fa fa-instagram"></i></a></li>
						<li><a href="http://www.youtube.com/c/universitastarumanagara" class="youtube"><i class="fa fa-youtube"></i></a></li>
						<li><a href="https://www.tiktok.com/@untarjakarta" class="fa fa-tiktok"><i class="fa fa-tiktok"></i></a></li>
					</ul>
				</div>
				<!-- /social -->

				<!-- copyright -->
				<div class="col-md-8 col-md-pull-4">
					<div class="footer-copyright">
						<span>&copy; Copyright 2022. All Rights Reserved. Universitas Tarumanagara</span>
					</div>
				</div>
				<!-- /copyright -->

			</div>
			<!-- row -->

		</div>
		<!-- /container -->

	</footer>
	<!-- /Footer -->

	<!-- preloader -->
	<div id='preloader'><div class='preloader'></div></div>
	<!-- /preloader -->


	<!-- jQuery Plugins -->
	<script type="text/javascript" src="assetsnewlintar/js/jquery.min.js"></script>
	<script type="text/javascript" src="assetsnewlintar/js/bootstrap.min.js"></script>
	
	<script type="text/javascript" src="assetsnewlintar/js/main.js"></script>
	 <!-- javascript -->
	<script src="assetsnewlintar/owlcarousel/owl.carousel.js"></script>

	<script>
		$(document).ready(function() {
		  $('.owl-carousel').owlCarousel({
			loop: true,
			margin: 10,
			responsiveClass: true,
			responsive: {
			  0: {
				items: 1,
				nav: true
			  },
			  600: {
				items: 2,
				nav: false
			  },
			  1000: {
				items: 3,
				nav: true,
				loop: false,
				margin: 20
			  }
			}
		  })
		})
	  </script>

</body>
</html>


</html>
