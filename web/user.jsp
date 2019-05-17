<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DatabaseMetaData"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        HttpSession mySession = request.getSession();
        if (mySession.getAttribute("username") == null) {
            response.sendRedirect("index.jsp?err=Nombre%20o%20contraseña%20inválida.");
        }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil usuario</title>

    </head>
    <script>
        var nRegistros = 0;
        function callRESTCreateTable() {
            var method = "POST";
            var target = 'http://localhost:8080/POmega/webresources/Tables';
            var msg = "";


            var username = document.getElementById("username").value;
            var nombreTabla = document.getElementById("tblName").value;

            var tableRef = document.getElementById('tablaNueva').getElementsByTagName('tbody')[0];
            var numFields = tableRef.rows.length - 1;


            var QueryString = "create table " + nombreTabla + "(";

            var stringKey;

            for (var i = 1; i < numFields + 1; i++) {
                var stringName = "fieldName" + i;
                var stringType = "ddl" + i;
                var stringLength = "length" + i;
                var stringRadio = "radio" + i;

                var elementName = document.getElementById(stringName).value;
                var elementType = document.getElementById(stringType).value;

                if (elementType == 'varchar') {
                    var elementLength = document.getElementById(stringLength).value;

                    QueryString = QueryString + elementName + " " + elementType + "(" + elementLength + "),";
                } else {
                    QueryString = QueryString + elementName + " " + elementType + ",";
                }

                if (document.getElementById(stringRadio).checked) {
                    stringKey = elementName;
                }
            }

            QueryString = QueryString + "primary key (" + stringKey + "))";

            var FinalQueryString = QueryString;
            console.log(FinalQueryString);
            var ajaxRequest;
            if (window.XMLHttpRequest) {
                ajaxRequest = new XMLHttpRequest(); // IE7+, Firefox, Chrome, Opera, Safari
            } else {
                ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP"); // IE6, IE5
            }
            ajaxRequest.onreadystatechange = function () {
                if (ajaxRequest.readyState == 4 &&
                        (ajaxRequest.status == 200 || ajaxRequest.status == 204)) {
                    alert("Query Exitoso");
                }
            }

            var targets = target + "?" + "query=" + FinalQueryString + "&username=" + username + "&tableName=" + nombreTabla;
            console.log(targets)
            ajaxRequest.open(method, targets, true /*async*/);
            ajaxRequest.setRequestHeader("Content-Type", "text/html");
            ajaxRequest.send(msg);

        }

        function createInsertQuery(user, method, target) {
            var username = document.getElementById(user).value;
            var nombreTabla = document.getElementById("tblName").value;
            var numFields = document.getElementById("numFields").value;
            var numFieldsInt = parseInt(numFields);
            var QueryString = "insert into ROOT." + nombreTabla + " values (";

            for (var i = 0; i < numFieldsInt; i++) {
                var stringName = "fieldName" + i;
                var stringType = "ddl" + i;

                var elementName = document.getElementById(stringName).value;
                var elementType = document.getElementById(stringType).value;

                if (elementType == 'varchar') {
                    QueryString = QueryString + "'" + elementName + "'";
                } else {
                    QueryString = QueryString + elementName;
                }

                if ((numFieldsInt - i) != 1) {
                    QueryString = QueryString + ",";
                }
            }

            QueryString = QueryString + ")";

            var FinalQueryString = QueryString;

            var ajaxRequest;
            if (window.XMLHttpRequest) {
                ajaxRequest = new XMLHttpRequest(); // IE7+, Firefox, Chrome, Opera, Safari
            } else {
                ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP"); // IE6, IE5
            }
            ajaxRequest.onreadystatechange = function () {
                if (ajaxRequest.readyState == 4 &&
                        (ajaxRequest.status == 200 || ajaxRequest.status == 204)) {
                    alert("Insert Exitoso");
                }
            }

            var targets = target + "?" + "queryParam=" + FinalQueryString + "&username=" + username;

            ajaxRequest.open(method, targets, true /*async*/);
            ajaxRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            ajaxRequest.send();

        }

        function formatTable(strTable) {
            if (strTable === "") {
                return "No hay tablas por el momento.";
            }
            var rows = strTable.split(";");


            var cols;
            var html = "<table border=\"1\"><tbody>";
            html += "<tr><th>Nombre de la tabla</th></tr>"
            for (var i = 1; i < rows.length - 1; i++) {
                cols = rows[i].split(",");
                html += "<tr><td>" + cols[1] + "</td></tr>";
            }
            html += "<tbody></table>";

            return html;
        }
        function formatHTMLTable(strTable) {
            if (strTable === "") {
                return "Tabla no encontrada.";
            }
            var rows = strTable.split(";");
            console.log(rows);
            var cols;
            var html = "<table border=\"1\"><tbody>";
            for (var i = 0; i < rows.length; i++) {
                cols = rows[i].split(",");
                console.log(cols);
                html += "<tr>";
                for (var j = 0; j < cols.length - 1; j++) {
                    html += "<td>" + cols[j] + "</td>";
                }
                html += "</tr>";
            }
            html += "</tbody></table>";
            console.log(html);
            return html;
        }

        function formatHTMLTableNRows(strTable, n) {
            if (strTable === "") {
                return "Tabla no encontrada.";
            }
            var rows = strTable.split(";");
            console.log(rows);
            var cols;
            var html = "<table border=\"1\"><tbody>";
            for (var i = 0; i < rows.length; i++) {
                if (i===n+1)
                    break;
                cols = rows[i].split(",");
                console.log(cols);
                html += "<tr>";
                for (var j = 0; j < cols.length - 1; j++) {
                    html += "<td>" + cols[j] + "</td>";
                }
                html += "</tr>";
            }
            html += "</tbody></table>";
            console.log(html);
            return html;
        }

        function updateTableList() {
            var method = "GET";
            var target = 'http://localhost:8080/POmega/webresources/Tables';
            var username = document.getElementById("username").value;
            var idTarget = "userTables";

            var ajaxRequest;
            if (window.XMLHttpRequest) {
                ajaxRequest = new XMLHttpRequest(); // IE7+, Firefox, Chrome, Opera, Safari
            } else {
                ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP"); // IE6, IE5
            }
            ajaxRequest.onreadystatechange = function () {
                if (ajaxRequest.readyState == 4 && ajaxRequest.status == 200) {
                    var data = ajaxRequest.responseText;
                    data = formatTable(data);
                    document.getElementById(idTarget).innerHTML = data;
                }
            }
            var target = target + "?username=" + username;

            ajaxRequest.open(method, target, true); //Utilizando POST
            ajaxRequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            ajaxRequest.send("username=" + username);
        }

        function updateRow(user, method, target) {
            var username = document.getElementById(user).value;

            var ajaxRequest;
            if (window.XMLHttpRequest) {
                ajaxRequest = new XMLHttpRequest(); // IE7+, Firefox, Chrome, Opera, Safari
            } else {
                ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP"); // IE6, IE5
            }
            ajaxRequest.onreadystatechange = function () {
                if (ajaxRequest.readyState == 4 &&
                        (ajaxRequest.status == 200 || ajaxRequest.status == 204)) {
                    alert("¡Update Exitoso!");
                }
            }

            var table = document.getElementById("tblNameEdit").value;
            var column = document.getElementById("updateColumn").value;
            var valor = document.getElementById("updateValor").value;
            var id = document.getElementById("deleteID").value;

            var queryParam = "UPDATE ROOT." + table + " SET " + column + " = " + valor + " WHERE ID=" + id;
            var targets = target + "?" + "queryParam=" + queryParam + "&username=" + username;

            alert(targets);
            alert(queryParam);

            ajaxRequest.open(method, targets, true);
            ajaxRequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            ajaxRequest.send();
        }

        function deleteRow(user, method, target) {
            var username = document.getElementById(user).value;

            var ajaxRequest;
            if (window.XMLHttpRequest) {
                ajaxRequest = new XMLHttpRequest(); // IE7+, Firefox, Chrome, Opera, Safari
            } else {
                ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP"); // IE6, IE5
            }
            ajaxRequest.onreadystatechange = function () {
                if (ajaxRequest.readyState == 4 &&
                        (ajaxRequest.status == 200 || ajaxRequest.status == 204)) {
                    alert("¡Delete Exitoso!");
                }
            }

            var id = document.getElementById("deleteID").value;
            var table = document.getElementById("tblNameEdit").value;

            var targets = target + "?" + "username=" + username + "&id=" + id + "&table=" + table;

            ajaxRequest.open(method, targets, true);
            ajaxRequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            ajaxRequest.send();
        }
        function disableLongitud(id, value) {
            var num = id.replace(/\D/g, "");
            var lonId = "length" + num;
            if (value === "varchar") {
                document.getElementById(lonId).disabled = false;
            } else {
                document.getElementById(lonId).disabled = true;
            }

        }

        function agregarCampo() {

            var tableRef = document.getElementById('tablaNueva').getElementsByTagName('tbody')[0];

            var rowNum = tableRef.rows.length;
            var myHtmlContent = `
            <tr>
                    <td><input id="fieldName` + rowNum + `" type='text' value=''/></td>
                    <td><select id="ddl` + rowNum + `" name='ddlTypeField' onchange="disableLongitud(this.id, this.value)">
                            <option >varchar</option>
                            <option>int</option>
                            <option>double</option>
                            <option>boolean</option>
                        </select></td>
                    <td><input id="radio` + rowNum + `" type="radio" name='PrimaryKey' value=''/></td>
                    <td><input id="length` + rowNum + `" type='text' name='Longitud' value=''/></td>
                </tr>
    `

            var newRow = tableRef.insertRow(rowNum);
            document.getElementById("btnBorrarCampo").disabled = false;
//            if(tableRef.rows.length===0){
//                document.getElementById("btnBorrarCampo").disabled=false;
//            }
            newRow.innerHTML = myHtmlContent;

        }

        function borrarCampo() {
            var tableRef = document.getElementById('tablaNueva').getElementsByTagName('tbody')[0];
            var rowNum = tableRef.rows.length;
            if (rowNum === 1) {
                document.getElementById("btnBorrarCampo").disabled = true;
                return;
            } else if (rowNum === 2) {
                document.getElementById("btnBorrarCampo").disabled = true;
            }
            var newRow = tableRef.deleteRow(rowNum - 1);

        }

        function cargarNRegistros() {
            var method = "GET";
            var target = 'http://localhost:8080/POmega/webresources/OneTable';
            var tableName = document.getElementById("nomTablaMuestraN").value;
            var idTarget = "tablaNRegistros";
            var nRows = document.getElementById("numRegistros").value;
            var ajaxRequest;
            if (window.XMLHttpRequest) {
                ajaxRequest = new XMLHttpRequest(); // IE7+, Firefox, Chrome, Opera, Safari
            } else {
                ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP"); // IE6, IE5
            }
            ajaxRequest.onreadystatechange = function () {
                if (ajaxRequest.readyState == 4 && ajaxRequest.status == 200) {
                    var data = ajaxRequest.responseText;
                    data = formatHTMLTableNRows(data,nRows);
                    document.getElementById(idTarget).innerHTML = data;
                }
            }
            var target = target + "?tableName=" + tableName;
            console.log(target);

            ajaxRequest.open(method, target, true); //Utilizando POST
            ajaxRequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            ajaxRequest.send("username=" + username);

        }



    </script>
    <body onload="updateTableList()">
        <h1 style="margin-left: auto; margin-right: auto;">Proyecto Omega</h1>
        <a href="Logout">Cerrar Sesión</a>
        <br />
        <h2>Bienvenido <%=mySession.getAttribute("username")%>!<br></h2>

        <input type="submit" value="Ver tablas" onclick = "updateTableList()"/>

        <div id='userTables'></div>         
        <br/>

        <h2>Crear tabla</h2>
        Nombre de la tabla: <input type="text" id='tblName' />
        <br />
        <input id='username' type="hidden" name="Fields" value=<%=mySession.getAttribute("username")%> />

        <table border="1" id="tablaNueva">
            <tr><th>Nombre del campo</th><th>Tipo del campo</th><th>Llave primaria</th><th>Longitud</th>
            </tr>
            <tbody>

            </tbody>
        </table>
        <button onclick="agregarCampo()">Agregar campo</button>
        <button id="btnBorrarCampo" onclick="borrarCampo()" disabled=true>Borrar campo</button>

        <br>
        <div id="respuesta"></div>
        <input type="submit" value="Crear tabla" onclick="callRESTCreateTable()" />
        <br/>
        <br>

        <h2>Edit/Delete Row</h2>
        Table name: <input type="text" id='tblNameEdit' />
        Row ID: <input id="deleteID" type="text" name="deleteID" value="" />
        <input type="submit" value="Delete" onclick="deleteRow('username', 'DELETE',
                        'http://localhost:8080/POmega/webresources/MyPath')" />
        <br/>
        Edit field: <input id="updateColumn" type="text" name="updateColumn" value="" />
        To new value: <input id="updateValor" type="text" name="updateValor" value="" />
        <br>
        ** Add ' ' to the new value in case of varchar.**
        <br>
        <input type="submit" value="Update" onclick="updateRow('username', 'POST',
                        'http://localhost:8080/POmega/webresources/SecondRest')" />
        <br> 

        <h2>REGISTROS</h2>
        Nombre de la tabla: <input id="nomTablaMuestraN" type="text" value="" />
        Número de registros por mostrar (N): <input id="numRegistros" type="text" name="numRegistros" value="" />
        <br>
        <input type="submit" value="Primeros N" onclick="cargarNRegistros()"/>
        <div id="tablaNRegistros"></div>
    </body>
</html>