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
        <h1 style="margin-left: auto; margin-right: auto;">DataWeb Wizard</h1>
        <h3>Isaac, Pedro y Daniel</h3>

        <div style="width: 50%;">
            <hr>
            <form method="GET" action="Login">
                <h2>Iniciar sesión</h2>
                <br/>
                Usuario:  <input type="text" name="username" />
                <br/>
                <br/>
                Contraseña:  <input type="password" name="password" />            
                <br/>
                <br/>
                <input type="submit" value="Iniciar sesión" />
            </form>
            <hr>
            <form method="GET" action="Register">
                <h2>Registro de cuenta</h2>
                <br/>
                Usuario: <input type="text" name="username" />
                <br/>
                <br/>
                Contraseña: <input type="password" name="password" />            
                <br/>

                <br>
                <input type="submit" value="Registrarme" />
            </form>

        </div>  
        <br>
        <a id="msg" style="color: blue;font-style: italic">
            <%
                String s = request.getParameter("err");
                if (s != null) {
                    out.println(s);
                }
            %>
        </a>
    </center>

</body> 
</html>