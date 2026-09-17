<%@page import="java.util.List"%>
<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Reportes de Usuarios</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f4f6f9; margin: 25px; }
        .grid { display: flex; gap: 20px; margin-bottom: 20px; }
        .card { background: white; padding: 20px; border-radius: 8px; flex: 1; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        table { width: 100%; border-collapse: collapse; background: white; margin-top: 15px; }
        th, td { padding: 10px; border: 1px solid #ddd; text-align: left; }
        th { background: #1f2d3d; color: white; }
        input, select, button { padding: 8px; }
        button { background: #0066cc; color: white; border: none; border-radius: 4px; cursor: pointer; }
    </style>
</head>
<body>
<h2>Consultas y Reportes Parametrizados: Usuarios</h2>
<a href="../../index.jsp">Volver al Inicio</a>

<div class="grid" style="margin-top: 15px;">
    <div class="card">
        <h4>Reporte 1: Filtrar por Rol</h4>
        <form action="../../ServletUsuario" method="GET">
            <input type="hidden" name="accion" value="reporteRol">
            <select name="cboRol">
                <option value="Administrador">Administrador</option>
                <option value="Editor">Editor</option>
                <option value="Periodista">Periodista</option>
            </select>
            <button type="submit">Generar</button>
        </form>
    </div>

    <div class="card">
        <h4>Reporte 2: Buscar por Coincidencia en Nombre</h4>
        <form action="../../ServletUsuario" method="GET">
            <input type="hidden" name="accion" value="reporteNombre">
            <input type="text" name="txtFiltro" placeholder="Texto a buscar..." required>
            <button type="submit">Buscar</button>
        </form>
    </div>
</div>

<%
    List<Usuario> resultados = (List<Usuario>) request.getAttribute("resultadoReporte");
    if (resultados != null) {
%>
<h3>Resultados de la Consulta</h3>
<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Rol</th>
        </tr>
    </thead>
    <tbody>
        <% if (resultados.isEmpty()) { %>
            <tr><td colspan="3" style="text-align:center;">No se encontraron registros.</td></tr>
        <% } else {
            for (Usuario usr : resultados) { %>
            <tr>
                <td><%= usr.getId() %></td>
                <td><%= usr.getNombre() %></td>
                <td><%= usr.getRol() %></td>
            </tr>
        <%  }
           } %>
    </tbody>
</table>
<% } %>
</body>
</html>