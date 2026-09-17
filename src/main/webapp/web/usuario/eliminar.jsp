<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario u = (Usuario) session.getAttribute("usuario.buscar");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Eliminar Usuario</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f4f6f9; margin: 20px; }
        .card { background: white; padding: 25px; border-radius: 8px; max-width: 450px; margin: auto; box-shadow: 0 2px 5px rgba(0,0,0,0.1); text-align: center; }
        .danger { color: #d9534f; margin-bottom: 20px; }
        button { background: #d9534f; color: white; border: none; padding: 10px 15px; border-radius: 4px; cursor: pointer; }
        a { color: #0066cc; text-decoration: none; margin-left: 10px; }
    </style>
</head>
<body>
<div class="card">
    <h2 class="danger">Confirmar Eliminación</h2>
    <% if (u != null) { %>
        <p>¿Está seguro de que desea eliminar al usuario <strong><%= u.getNombre() %></strong> (ID: <%= u.getId() %>)?</p>
        <form action="../../ServletUsuario" method="POST">
            <input type="hidden" name="accion" value="eliminar">
            <input type="hidden" name="txtId" value="<%= u.getId() %>">
            <button type="submit">Sí, eliminar</button>
            <a href="../../ServletUsuario?accion=listar">Cancelar</a>
        </form>
    <% } else { %>
        <p>No se ha especificado ningún usuario.</p>
        <a href="../../ServletUsuario?accion=listar">Ir al listado</a>
    <% } %>
</div>
</body>
</html>