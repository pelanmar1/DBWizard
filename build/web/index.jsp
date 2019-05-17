<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <title>Proyecto Omega</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>        
    <center>
        <h1 style="margin-left: auto; margin-right: auto;">Proyecto Omega - Manejador de bases de datos</h1>
        <h2>Isaac, Pedro y Daniel</h2>
        <div style="width: 50%;">
            <form method="GET" action="Login">
                <h3>Iniciar sesión</h3>
                <br/>
                Usuario:  <input type="text" name="username" />
                <br/>
                Contraseña:  <input type="password" name="password" />            
                <br/>
                <br>
                <input type="submit" value="Iniciar sesión" />
            </form>
            <form method="GET" action="Register">
                <h3>Registro de cuenta</h3>
                <br/>
                Usuario: <input type="text" name="username" />
                <br/>
                Contraseña: <input type="password" name="password" />            
                <br/>
                <br>
                <input type="submit" value="Registrarme" />
            </form>
        </div>       
    </center>
    <a id="msg" style="color: #FF0000;">
        <%
            String s = request.getParameter("err");
            if (s != null) {
                out.println(s);
            }
        %>
    </a>
</body> 
</html>