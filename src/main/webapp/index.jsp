<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario u = (Usuario) session.getAttribute("usuario.login");
    if (u == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel Principal - Gestión de Noticias</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; background: #f4f6f9; }
        header { background: #1f2d3d; color: white; padding: 15px 30px; display: flex; justify-content: space-between; align-items: center; }
        .container { max-width: 900px; margin: 40px auto; padding: 0 20px; }
        .grid { display: flex; gap: 20px; flex-wrap: wrap; }
        .card { background: white; padding: 25px; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); flex: 1; min-width: 260px; }
        .card h3 { margin-top: 0; color: #1f2d3d; }
        ul { list-style: none; padding: 0; }
        li { margin: 10px 0; }
        a { color: #0066cc; text-decoration: none; font-weight: bold; }
        a:hover { text-decoration: underline; }
        .btn-logout { background: #d9534f; color: white; padding: 6px 14px; text-decoration: none; border-radius: 4px; font-size: 14px; }
    </style>
</head>
<body>
<header>
    <div>
        <strong>Gestión de Noticias</strong> | Bienvenido, <%= u.getNombre() %> (<%= u.getRol() %>)
    </div>
    <div>
        <a href="ServletUsuario?accion=logout" class="btn-logout">Cerrar Sesión</a>
    </div>
</header>

<div class="container">
    <div class="grid">
        <div class="card">
            <h3>Módulo de Noticias</h3>
            <ul>
                <li><a href="ServletNoticia?accion=listar">Listar Noticias</a></li>
                <li><a href="web/noticia/agregar.jsp">Registrar Nueva Noticia</a></li>
                <li><a href="web/noticia/buscar.jsp">Buscar o Gestionar Noticia</a></li>
                <li><a href="web/noticia/reportes.jsp">Reportes de Noticias</a></li>
            </ul>
        </div>
        <div class="card">
            <h3>Módulo de Usuarios</h3>
            <ul>
                <li><a href="ServletUsuario?accion=listar">Listar Usuarios</a></li>
                <li><a href="web/usuario/agregar.jsp">Registrar Usuario</a></li>
                <li><a href="web/usuario/buscar.jsp">Buscar Usuario</a></li>
                <li><a href="web/usuario/reportes.jsp">Reportes de Usuarios</a></li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
EOF
3. Crear mensaje.jsp
Crea src/main/webapp/mensaje.jsp para capturar cualquier excepción o aviso general:

Bash
cat << 'EOF' > src/main/webapp/mensaje.jsp
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Notificación del Sistema</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f4f6f9; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .card { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); width: 400px; text-align: center; }
        .error-title { color: #d9534f; margin-top: 0; }
        .btn { display: inline-block; margin-top: 15px; padding: 8px 16px; background: #0066cc; color: white; text-decoration: none; border-radius: 4px; }
    </style>
</head>
<body>
<div class="card">
    <h2 class="error-title">Aviso del Sistema</h2>
    <p><%= request.getAttribute("error") != null ? request.getAttribute("error") : "Operación procesada con éxito." %></p>
    <a href="index.jsp" class="btn">Volver al Inicio</a>
</div>
</body>
</html>