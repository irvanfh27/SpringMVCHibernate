<%-- 
    Document   : formupdate
    Created on : May 16, 2017, 12:58:15 AM
    Author     : radius
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>JSP Page</title>
    </head>
    <body>
        <button type="button" onclick="loadDoc()">Request data</button>

        <p id="demo"></p>


        <script>
            function loadDoc() {
                html = '<form action="<c:url value="' + '/home/update' + '"/>" ' / 'method="post">';
                html = html + ' <p>Kode : <input type="text" name="kode" value="${product.kode}"/></p>';
                html = html + '  <p>Nama : <input type="text" name="nama" value="${product.nama}"/></p>';
                html = html + '<p>Harga : <input type="text" name="harga" value="${product.harga}"/></p>';
                html = html + '<p>Keterangan : <input type="text" name="keterangan" value="${product.keterangan}"/></p> ';
                html = html + ' <p>Software :<input type="text"  id="w-input-search" value="">';
                html = html + '  <input type="hidden" name="id" value="${product.id}"/>';
                html = html + ' <p><input type="submit" value="Update" class="button tiny"/></p>';
                html = html + '  <p>Software Develop :<input type="text"  id="wpopoup" value="">';
                html = html + '</form>';
                document.getElementById("demo").innerHTML = html;
            }
        </script>
    </body>
</html>
