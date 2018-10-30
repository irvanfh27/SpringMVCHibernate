<%-- 
    Document   : layoutnavigasi
    Created on : Jan 17, 2017, 11:54:51 PM
    Author     : radius
--%>

<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
    <head>
        <style type="text/css">
            .tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
            .tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
            .tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
            .tg .tg-4eph{background-color:#f9f9f9}
            #mkr {
                position: absolute;
                height: 70px;
                top: 160px; 
                left: 70px; 
                z-index: 2; 
            }
        </style>
        <title>Bootstrap Example</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
        <link href="<c:url value="/resources/dist/css/bootstrap.css" />" rel="stylesheet">
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="resources/assets/css/ilmudetil.css">
        <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
        <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
        <script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
        <script src="<c:url value="/resources/core/sweetalert.min.js" />"></script>
        <link href="<c:url value="/resources/core/sweetalert.css" />" rel="stylesheet">
        <script src="<c:url value="/resources/dist/js/bootstrap.js" />"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.min.js"></script>


        <%--  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> --%>
        <style>
            div.container {
                width: 100%;

            }

            header {
                padding: 1em;
                color: white;
                background-color: black;
                clear: left;
                text-align: center;
            }

            nav {
                float: left;
                max-width: 160px;
                margin: 0;
                padding: 1em;
            }

            nav ul {
                list-style-type: none;
                padding: 0;
            }

            nav ul a {
                text-decoration: none;
            }

            article {
                margin-left: 170px;
                border-left: 0px solid gray;
                padding: 1em;
                overflow: hidden;
            }

            .vertical-menu {
                width: 200px; /* Set a width if you like */
            }

            .vertical-menu a {
                background-color: #eee; /* Grey background color */
                color: black; /* Black text color */
                display: block; /* Make the links appear below each other */
                padding: 12px; /* Add some padding */
                text-decoration: none; /* Remove underline from links */
            }

            .vertical-menu a:hover {
                background-color: #ccc; /* Dark grey background on mouse-over */
            }

            .vertical-menu a.active {
                background-color: #4CAF50; /* Add a green color to the "active/current" link */
                color: white;
            }
        </style>



    </head>
    <body>
        <script type="text/javascript">
            function validateForm() {
                // alert('test');
                //evt.currentTarget.className += " w3-red";
                $("#myModal").modal('show');

            }
            ;


            $(document).ready(function () {

                /*   $("button").click(function () {
                 $("#myModal").modal('show');
                 });*/




                $(function () {
                    $("#tgl_lahir").datepicker({dateFormat: 'dd-mm-yy'});
                    $("#formInput").datepicker({dateFormat: 'dd-mm-yy'}).bind("change", function () {
                        var minValue = $(this).val();
                        minValue = $.datepicker.parseDate("dd-mm-yy", minValue);
                        minValue.setDate(minValue.getDate() + 1);
                        $("#to").datepicker("option", "minDate", minValue);
                    })
                });
            });
        </script>    


        <div class="w3-container">


            <header class="w3-container w3-blue" style="height: 120px">
                <h1>City Gallery</h1>
            </header>

            <div class="w3-sidebar w3-bar-block w3-black w3-card-2"  style="width:130px" id="bs-example-navbar-collapse-1">
                <h3 class="w3-bar-item">M E N U</h3>
                <button class="w3-bar-item w3-button tablink w3-hover-shadow" onclick="openCity(event, 'penduduk')">Peta Wilayah</button>
                <button class="w3-bar-item w3-button tablink w3-hover-shadow" onclick="openCity(event, 'chart')">Chart</button>
                <button class="w3-bar-item w3-button tablink w3-hover-shadow" onclick="openCity(event, 'persons')">nominatif person</button>
                <button class="w3-bar-item w3-button tablink w3-hover-shadow" onclick="openCity(event, 'paginate')">tabel paginate</button>
                <button class="w3-bar-item w3-button tablink w3-hover-shadow" onclick="openCity(event, 'autokomplit')">autokomplit</button>
                <button class="w3-bar-item w3-button tablink w3-hover-shadow" onclick="openCity(event, 'formupdate')">forminput</button>
                <button class="w3-bar-item w3-button tablink w3-hover-shadow" onclick="openCity(event, 'mapShp')">MAPSHP</button>
                <button class="w3-bar-item w3-button tablink w3-hover-shadow" onclick="openCity(event, 'myModal')" >Input</button>

            </div>
            <article>
                <div class="w3-main" style="margin-left:130px"> 
                    <div  class="w3-teal" id="div1"></div>

                    <div id="myModal" class="modal fade">
                        <c:url var="addAction" value="/person/add" ></c:url>
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title">Konfirmasi</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form role="form" id="formInput" class="form-horizontal">
                                            <div class="form-group has-feedback">
                                                <label class="control-label col-sm-2" for="nama">Nama :</label>
                                                <div class="col-sm-10">
                                                    <input type="text" name="nama" id="nama" class="form-control textbox">
                                                    <i class="form-control-feedback"></i>
                                                    <span class="text-warning" ></span>
                                                </div>
                                            </div>

                                            <div class="form-group  has-feedback">
                                                <label class="control-label col-sm-2" for="tgl_lahir">Tanggal Lahir</label>
                                                <div class="col-sm-10">
                                                    <input type="text" name="tgl_lahir" id="tgl_lahir" placeholder="Enter tgl" class="form-control textbox">
                                                    <i class="form-control-feedback"></i>
                                                    <span class="text-warning" ></span>
                                                </div>
                                            </div>

                                            <div class="form-group has-feedback">
                                                <label class="control-label col-sm-2" for="email">Email Anda:</label>
                                                <div class="col-sm-10">
                                                    <input type="text"  class="form-control textbox" id="email" >
                                                    <i class="form-control-feedback"></i>
                                                    <span class="text-warning" ></span>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <label class="control-label col-sm-2" for="jk">Jenis Kelamin:</label>
                                                <div class="col-sm-10">
                                                    <select class="form-control" id="jk" onchange="displayDate()">
                                                        <option value="1" selected="selected">Pria</option>
                                                        <option value="2">Wanita</option>
                                                    </select>
                                                </div>
                                                <input type="hidden" name ="srt" id="srt" ><br>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-2" for="alamat">Software Develop :</label>
                                                <div class="col-sm-10">

                                                    <input type="text"  class="form-control" id="w-input-search" value="">

                                                </div>
                                            </div>
                                            <button type="submit" name="btn-simpan" class="btn btn-primary btn-block">Simpan</button>

                                        </form>

                                        <p class="text-warning"><small>Peringatan : Data akan hilang jika tidak disimpan.</small></p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                                        <input type="reset" id="configreset"  onclick="myFunctionRest()" class="btn btn-danger" value="Reset">

                                    </div>
                                </div>
                            </div>		
                        </div>
                    </div>
                </article>

            </div>



            <script type="text/javascript">


                function openCity(evt, ename) {

                    var i, x, tablinks;
                    /*  x = document.getElementsByClassName("city");
                     * 
                     for (i = 0; i < x.length; i++) {
                     x[i].style.display = "none";
                     }*/
                    var inpObj = ename;

                    tablinks = document.getElementsByClassName("tablink");
                    for (i = 0; i < tablinks.length; i++) {
                        tablinks[i].className = tablinks[i].className.replace("w3-red", "");
                        // alert(tablinks[i].className);
                    }
                    evt.currentTarget.className += " w3-red";
                    if (inpObj == 'myModal') {
                        validateForm(evt);
                    } else if (inpObj == 'chart') {
                        // $("#div1").load("chart");
                        //alert("test");
                        $.ajax({
                            url: '${pageContext.request.contextPath}/chart',
                            type: "GET",
                            success: function (data) {
                                $("#div1").append(data);
                            }
                        });


                    } else if (inpObj == 'penduduk') {
                        // $("#div1").load("chart");
                        //alert("test");
                        $.ajax({
                            url: '${pageContext.request.contextPath}/penduduk',
                            type: "GET",
                            success: function (data) {
                                $("#div1").append(data);
                            }
                        });


                    } else {
                        location.href = ename;
                    }

                    // document.getElementById(cityName).style.display = "block";

                }

                $(document).ready(function () {
                    $('input').each(function () {
                        $(this).blur(function () { //blur function itu dijalankan saat element kehilangan fokus
                            if (!$(this).val()) { //this mengacu pada text box yang sedang fokus
                                return get_error_text(this); //function get_error_text ada di bawah
                            } else {
                                $(this).removeClass('no-valid');
                                $(this).parent().find('.text-warning').hide();//cari element dengan class has-warning dari element induk text yang sedang focus
                                $(this).closest('div').removeClass('has-warning');
                                $(this).closest('div').addClass('has-success');
                                $(this).parent().find('.form-control-feedback').removeClass('glyphicon glyphicon-warning-sign');
                                $(this).parent().find('.form-control-feedback').addClass('glyphicon glyphicon-ok');
                            }
                        });
                    });

                    $('#nama').blur(function () {
                        var nama = $(this).val();
                        var len = nama.length;
                        if (len > 0) { //jika ada isinya
                            if (!valid_nama(nama)) { //jika nama tidak valid
                                $(this).parent().find('.text-warning').text("");
                                $(this).parent().find('.text-warning').text("Nama Tidak Valid");
                                return apply_feedback_error(this);
                            } else {
                                if (len > 30) { //jika karakter >30
                                    $(this).parent().find('.text-warning').text("");
                                    $(this).parent().find('.text-warning').text("Maximal Karakter 30");
                                    return apply_feedback_error(this);
                                }
                            }
                        }
                    });
                    $('#tgl_lahir').blur(function () {
                        var tgl = $(this).val();
                        var len = tgl.length;
                        if (len > 0) {
                            if (!valid_tanggal(tgl)) {
                                $(this).parent().find('.text-warning').text("");
                                $(this).parent().find('.text-warning').text("Format Tanggal yang diperbolehkan mm-dd-yyy, mm/dd/yyyy atau dd/mm/yyyy, dd-mm-yyyy");
                                return apply_feedback_error(this);
                            }
                        }
                    });

                    //mengecek text box email
                    $('#email').blur(function () {
                        var email = $(this).val();
                        var len = email.length;
                        if (len > 0) {
                            if (!valid_email(email)) {
                                $(this).parent().find('.text-warning').text("");
                                $(this).parent().find('.text-warning').text("E-mail Tidak Valid (ex: aaaa@yahoo.co.id)");
                                return apply_feedback_error(this);
                            } else {
                                if (len > 30) {
                                    $(this).parent().find('.text-warning').text("");
                                    $(this).parent().find('.text-warning').text("Maximal Karakter 30");
                                    return apply_feedback_error(this);
                                } else {
                                    var valid = false;
                                    $.ajax({
                                        url: "checkemail.php",
                                        type: "POST",
                                        data: "email=" + email,
                                        dataType: "text",
                                        success: function (data) {
                                            if (data == 0) { //pada file check email.php, apabila email sudah ada di database makan akan mengembalikan nilai 0
                                                $('#email').parent().find('.text-warning').text("");
                                                $('#email').parent().find('.text-warning').text("email sudah ada");
                                                return apply_feedback_error('#email');
                                            }
                                        }
                                    });
                                }
                            }
                        }
                    });

                    $('#formInput').submit(function (e) {
                        e.preventDefault();
                        var valid = true;
                        $(this).find('.textbox').each(function () {
                            if (!$(this).val()) {
                                get_error_text(this);
                                valid = false;
                                $('html,body').animate({scrollTop: 0}, "slow");
                            }
                            if ($(this).hasClass('no-valid')) {
                                valid = false;
                                $('html,body').animate({scrollTop: 0}, "slow");
                            }
                        });
                        if (valid) {
                            swal({
                                title: "Konfirmasi Simpan Data",
                                text: "Data Akan di Simpan Ke Database",
                                type: "info",
                                showCancelButton: true,
                                confirmButtonColor: "#1da1f2",
                                confirmButtonText: "Yakin, dong!",
                                closeOnConfirm: false,
                                showLoaderOnConfirm: true,
                            }, function () { //apabila sweet alert d confirm maka akan mengirim data ke simpan.php melalui proses ajax
                                $.ajax({
                                    url: '${pageContext.request.contextPath}/getformSaveInput',
                                    type: "POST",
                                    data: $('#formInput').serialize(), //serialize() untuk mengambil semua data di dalam form
                                    dataType: "html",
                                    success: function () {
                                        setTimeout(function () {
                                            swal({
                                                title: "Data Berhasil Disimpan",
                                                text: "Terimakasih",
                                                type: "success"
                                            }, function () {
                                                //window.location = "tampil.php";
                                            });
                                        }, 2000);
                                    },
                                    error: function (xhr, ajaxOptions, thrownError) {
                                        setTimeout(function () {
                                            swal("Error", "Tolong Cek Koneksi Lalu Ulangi", "error");
                                        }, 2000);
                                    }
                                });
                            });
                        }
                    });


                    $('#w-input-search').autocomplete({
                        serviceUrl: '${pageContext.request.contextPath}/getTags',
                        paramName: "tagName",
                        delimiter: ",",
                        transformResult: function (response) {

                            return {
                                suggestions: $.map($.parseJSON(response), function (item) {

                                    return {value: item.tagName, data: item.id};
                                })

                            };

                        }

                    });

                    $('#configreset').click(function () {
                        $('#configform')[0].reset();
                    });



                });

                function valid_nama(nama) {
                    var pola = new RegExp(/^[a-z A-Z]+$/);
                    return pola.test(nama);
                }
                function valid_tanggal(tanggal) {
                    var pola = new RegExp(/\b\d{1,2}[\/-]\d{1,2}[\/-]\d{4}\b/);
                    return pola.test(tanggal);
                }
                //fungsi cek email
                function valid_email(email) {
                    var pola = new RegExp(/^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]+$/);
                    return pola.test(email);
                }
                //fungsi cek phone 
                function valid_hp(hp) {
                    var pola = new RegExp(/^[0-9-+]+$/);
                    return pola.test(hp);
                }

                function apply_feedback_error(textbox) {
                    $(textbox).addClass('no-valid'); //menambah class no valid
                    $(textbox).parent().find('.text-warning').show();
                    $(textbox).closest('div').removeClass('has-success');
                    $(textbox).closest('div').addClass('has-warning');
                    $(textbox).parent().find('.form-control-feedback').removeClass('glyphicon glyphicon-ok');
                    $(textbox).parent().find('.form-control-feedback').addClass('glyphicon glyphicon-warning-sign');
                }

                //untuk mendapat eror teks saat textbox kosong, digunakan saat submit form dan blur fungsi
                function get_error_text(textbox) {
                    $(textbox).parent().find('.text-warning').text("");
                    $(textbox).parent().find('.text-warning').text("Text Box Ini Tidak Boleh Kosong");
                    return apply_feedback_error(textbox);
                }



        </script>
        <script>
            function displayDate() {
                var e = document.getElementById("jk");
                var strUser = e.options[e.selectedIndex].value;
                document.getElementById("srt").value = document.getElementById("jk").value;

              //  var x = document.getElementById("mySelect").value;
              //  document.getElementById("demo").innerHTML = x;
               // alert(document.getElementById("srt").value);

                 // document.getElementById("srt").innerHTML = strUser;
            }
            ;

            function myFunctionRest() {
                document.getElementById("formInput").reset();
            }


        </script>

    </body>
</html>