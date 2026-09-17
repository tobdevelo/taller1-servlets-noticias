<%@page import="java.util.List"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Usuarios</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f4f6f9; margin: 30px; }
        table { width: 100%; border-collapse: collapse; background: white; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        th, td { padding: 12px; border: 1px solid #ddd; text-align: left; }
        th { background: #1f2d3d; color: white; }
        tr:nth-child(even) { background: #f9f9f9; }
        .top-bar { display: flex; justify-content: space-between; margin-bottom: 15px; }
        .btn { background: #0066cc; color: white; padding: 8px 14px; text-decoration: none; border-radius: 4px; }
    </style>
</head>
<body>
<div class="top-bar">
    <h2>Usuarios Registrados</h2>
    <div>
        <a href="agregar.jsp" class="btn">Nuevo Usuario</a>
        <a href="../../index.jsp" class="btn" style="background:#6c757d;">Inicio</a>
    </div>
</div>

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Rol</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        <%
            List<Usuario> lista = (List<Usuario>) session.getAttribute("usuario.listar");
            if (lista != null && !lista.isEmpty()) {
                for (Usuario u : lista) {
        %>
        <tr>
            <td><%= u.getId() %></td>
            <td><%= u.getNombre() %></td>
            <td><%= u.getRol() %></td>
            <td>
                <a href="../../ServletUsuario?accion=buscar&txtId=<%= u.getId() %>">Gestionar</a> |
                <a href="../../ServletUsuario?accion=eliminar&txtId=<%= u.getId() %>" onclick="return confirm('¿Seguro de eliminar este usuario?')">Eliminar</a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr><td colspan="4" style="text-align:center;">No hay usuarios cargados. <a href="../../ServletUsuario?accion=listar">Actualizar</a></td></tr>
        <% } %>
    </tbody>
</table>
</body>
</html>