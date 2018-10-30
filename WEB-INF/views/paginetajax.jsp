<%-- 
    Document   : paginetajax
    Created on : Apr 11, 2017, 11:53:09 PM
    Author     : radius
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>

        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css"/>
        <script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>

    </head>
    <body>
        <div style="width: auto; height: 750px; overflow-x: auto; overflow-y: auto;">
            <table id="example" class="display" cellspacing="0" width="100%"> 
                <thead>
                    <tr>

                        <th data-field="id">id</th>
                        <th data-field="tagName">tagName</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>

                         <th data-field="id">id</th>
                        <th data-field="tagName">tagName</th>
                    </tr>
                </tfoot>

            </table>

        </div>
        <script>

            $(document).ready(function () {
                $('#example').DataTable({
                    "ajax": '<c:url value="/resources/assets/css/filename.txt"/>',
                    "columns": [
                        {"data": "id"},
                        {"data": "tagName"}

                    ]
                });
            });
        </script>



    </body>


</html>

