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

            var stringKey = null;
            var keyLength;
            var keyType;

            for (var i = 1; i < numFields + 1; i++) {
                var stringName = "fieldName" + i;
                var stringType = "ddl" + i;
                var stringLength = "length" + i;
                var stringRadio = "radio" + i;

                var elementName = document.getElementById(stringName).value;
                var elementType = document.getElementById(stringType).value;

                if (document.getElementById(stringRadio).checked) {
                    stringKey = elementName;
                    keyType = elementType;
                    if (elementType === 'varchar') {
                        keyLength = document.getElementById(stringLength).value;
                        QueryString = QueryString + stringKey + " " + keyType + "(" + keyLength + "),";

                    } else {
                        QueryString = QueryString + stringKey + " " + keyType + ",";
                    }
                }



            }

            for (var i = 1; i < numFields + 1; i++) {
                var stringName = "fieldName" + i;
                var stringType = "ddl" + i;
                var stringLength = "length" + i;
                var stringRadio = "radio" + i;

                var elementName = document.getElementById(stringName).value;
                var elementType = document.getElementById(stringType).value;
                if (elementName === stringKey) {
                    continue;
                }

                if (elementType === 'varchar') {
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

        function deleteRowAJAX(tableName, pkName, rowID) {
            var target = "http://localhost:8080/POmega/webresources/OneTable";
            var url = target + "?tableName=" + tableName + "&pkName=" + pkName + "&rowID=" + rowID;

            var ajaxRequest;
            if (window.XMLHttpRequest) {
                ajaxRequest = new XMLHttpRequest(); // IE7+, Firefox, Chrome, Opera, Safari
            } else {
                ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP"); // IE6, IE5
            }
            ajaxRequest.onreadystatechange = function () {
                if (ajaxRequest.readyState == 4 &&
                        (ajaxRequest.status == 200 || ajaxRequest.status == 204)) {
                    alert("Delete exitoso");
                }
            }
            console.log(url);
            ajaxRequest.open("delete", url, true /*async*/);
            ajaxRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            ajaxRequest.send();
        }
        function addRowAJAX() {
            var row = document.getElementById("rowAgregar");
            var rowStr = "";
            var tableName = document.getElementById("nomTablaMuestraN").value;
            for (var i = 0; i < row.cells.length - 1; i++)
            {
                var val = row.cells[i].firstChild.value;
                console.log(val);
                rowStr += "" + val + ",";
            }
            rowStr = rowStr.substr(0, rowStr.length - 1);

            var target = "http://localhost:8080/POmega/webresources/OneTable";
            var url = target + "?tableName=" + tableName + "&rowStr=" + rowStr;

            var ajaxRequest;
            if (window.XMLHttpRequest) {
                ajaxRequest = new XMLHttpRequest(); // IE7+, Firefox, Chrome, Opera, Safari
            } else {
                ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP"); // IE6, IE5
            }
            ajaxRequest.onreadystatechange = function () {
                if (ajaxRequest.readyState == 4 &&
                        (ajaxRequest.status == 200 || ajaxRequest.status == 204)) {
                    alert("Insert exitoso");
                }
            }
            console.log(url);
            ajaxRequest.open("post", url, true /*async*/);
            ajaxRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            ajaxRequest.send();
        }
        function formatHTMLTableNRows(strTable, n) {
            var tableName = document.getElementById("nomTablaMuestraN").value;
            if (n === "") {
                n = 10000;
            } else {
                n = parseInt(n);
            }
            if (strTable === "") {
                return "Tabla no encontrada o sin datos.";
            }
            var rows = strTable.split(";");
            var cols;
            var pkName;
            var rowID;
            var html = "<table border=\"1\"><tbody>";
            for (var i = 0; i < rows.length - 1; i++) {
                if (i === n + 1)
                    break;
                cols = rows[i].split(",");
                html += "<tr>";
                for (var j = 0; j < cols.length; j++) {
                    if (i === 0) {
                        html += "<th>" + cols[j] + "</th>";
                        pkName = cols[0];
                    } else {
                        rowID = cols[0];
                        html += "<td>" + cols[j] + "</td>";
                    }
                }
                // Delete Edit
                if (i === 0) {
                    html += "<th>ELIMINAR</th>";
                } else {
                    html += "<td><button onclick=\"deleteRowAJAX('" + tableName + "','" + pkName + "','" + rowID + "')\">Eliminar</Button></td>";
                }
                html += "</tr>";

            }

            html += "<tr id='rowAgregar'>";
            for (var j = 0; j < cols.length; j++) {
                html += "<td><input type='text'/></td>";
            }
            html += "<td><button onclick=\"addRowAJAX()\">Agregar</Button></td>";
            html += "</tr>";

            html += "</tbody></table>";
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
            if (nRows === "")
                nRows = 1000;
            var ajaxRequest;
            if (window.XMLHttpRequest) {
                ajaxRequest = new XMLHttpRequest(); // IE7+, Firefox, Chrome, Opera, Safari
            } else {
                ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP"); // IE6, IE5
            }
            ajaxRequest.onreadystatechange = function () {
                if (ajaxRequest.readyState == 4 && ajaxRequest.status == 200) {
                    var data = ajaxRequest.responseText;
                    console.log(data);
                    data = formatHTMLTableNRows(data, nRows);
                    document.getElementById(idTarget).innerHTML = data;
                }
            }
            var target = target + "?tableName=" + tableName;
            console.log(target);

            ajaxRequest.open(method, target, true); //Utilizando POST
            ajaxRequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            ajaxRequest.send("username=" + username);

        }
        function editarCampo() {
            var method = "PUT";
            var target = 'http://localhost:8080/POmega/webresources/OneTable';
            var tableName = document.getElementById("nomTablaMuestraN").value;
            var idUpdate = document.getElementById("idUpdate").value;
            var campoUpdate = document.getElementById("campoUpdate").value;
            var nuevoValor = document.getElementById("nuevoValor").value;

            var ajaxRequest;
            if (window.XMLHttpRequest) {
                ajaxRequest = new XMLHttpRequest(); // IE7+, Firefox, Chrome, Opera, Safari
            } else {
                ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP"); // IE6, IE5
            }
            ajaxRequest.onreadystatechange = function () {
                if (ajaxRequest.readyState == 4 && ajaxRequest.status == 200) {
                    var data = ajaxRequest.responseText;
                    console.log(data);
                    alert("Update exitoso.");
                }
            }
            var target = target + "?tableName=" + tableName + "&idUpdate=" + idUpdate + "&campoUpdate=" + campoUpdate + "&nuevoValor=" + nuevoValor;
            console.log(target);

            ajaxRequest.open(method, target, true); //Utilizando POST
            ajaxRequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            ajaxRequest.send("username=" + username);

        }


    </script>
    <body onload="updateTableList()">
    <center>
        <h1 style="margin-left: auto; margin-right: auto;">Proyecto Omega</h1>
        <a href="Logout">Cerrar Sesión</a>
        <br />
        <h2>Bienvenido <%=mySession.getAttribute("username")%>!<br></h2>

        <input type="submit" value="Ver tablas" onclick = "updateTableList()"/>

        <div id='userTables'></div>         
        <br/>

        <h2>Crear tabla</h2>
        Nombre de la nueva tabla: <input type="text" id='tblName' />
        <br />
        <br />
        <input id='username' type="hidden" name="Fields" value=<%=mySession.getAttribute("username")%> />

        <table border="1" id="tablaNueva">
            <tr><th>Nombre del campo</th><th>Tipo del campo</th><th>Llave primaria</th><th>Longitud</th>
            </tr>
            <tbody>

            </tbody>
        </table>
        <br />

        <button onclick="agregarCampo()">Agregar campo</button>
        <button id="btnBorrarCampo" onclick="borrarCampo()" disabled=true>Borrar campo</button>

        <input type="submit" value="Crear tabla" onclick="callRESTCreateTable()" />
        <br/>
        <br>

        <h2>REGISTROS</h2>
        Nombre de la tabla: <input id="nomTablaMuestraN" type="text" value="" /><br>
        <h4>Ver/Añadir registros</h4>
        Número de registros por mostrar (N): <input id="numRegistros" type="text" name="numRegistros" value="" />
        <input type="submit" value="Cargar datos" onclick="cargarNRegistros()"/>
        <div id="tablaNRegistros"></div>



        <h4>Editar campo</h4>
        ID: <input id="idUpdate" type="text"  value="" />
        Campo a cambiar: <input id="campoUpdate" type="text"  value="" />
        Nuevo valor: <input id="nuevoValor" type="text"  value="" />
        <input type="submit" value="Actualizar" onclick="editarCampo()" />
        <br> 
</center>
    </body>
</html>