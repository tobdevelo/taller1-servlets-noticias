<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario usu = (Usuario) session.getAttribute("usuario.login");
    if (usu == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel de Control - Sistema de Noticias</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f4f6f9; margin: 0; padding: 20px; }
        .header { background: #1f2d3d; color: white; padding: 15px 25px; border-radius: 6px; display: flex; justify-content: space-between; align-items: center; }
        .container { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-top: 25px; }
        .card { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        .card h3 { border-bottom: 2px solid #0066cc; padding-bottom: 8px; margin-top: 0; }
        ul { list-style: none; padding-left: 0; }
        li { margin: 10px 0; }
        a { text-decoration: none; color: #0066cc; font-weight: bold; }
        a:hover { text-decoration: underline; }
        .btn-logout { background: #d9534f; color: white; padding: 8px 14px; text-decoration: none; border-radius: 4px; font-weight: bold; }
    </style>
</head>
<body>

<div class="header">
    <div>
        <h2 style="margin: 0;">Sistema de Gestión de Noticias</h2>
        <small>Bienvenido: <%= usu.getNombre() %> | Rol: <strong><%= usu.getRol() %></strong></small>
    </div>
    <div>
        <a href="ServletUsuario?accion=cerrar" class="btn-logout">Cerrar Sesión</a>
    </div>
</div>

<div class="container">
    <!-- Modulo Usuarios -->
    <div class="card">
        <h3>Gestión de Usuarios</h3>
        <ul>
            <li><a href="web/usuario/agregar.jsp">Registrar Nuevo Usuario</a></li>
            <li><a href="ServletUsuario?accion=listar">Listar Todos los Usuarios</a></li>
            <li><a href="web/usuario/buscar.jsp">Buscar / Modificar Usuario</a></li>
            <li><a href="web/usuario/reportes.jsp">Consultas y Reportes de Usuarios</a></li>
        </ul>
    </div>

    <!-- Modulo Noticias -->
    <div class="card">
        <h3>Gestión de Noticias</h3>
        <ul>
            <li><a href="web/noticia/agregar.jsp">Registrar Nueva Noticia</a></li>
            <li><a href="ServletNoticia?accion=listar">Listar Todas las Noticias</a></li>
            <li><a href="web/noticia/buscar.jsp">Buscar Noticia por ID</a></li>
            <li><a href="web/noticia/reportes.jsp">Consultas y Reportes de Noticias</a></li>
        </ul>
    </div>
</div>

</body>
</html>