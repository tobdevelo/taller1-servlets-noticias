<%@page import="java.util.List"%>
<%@page import="modelo.Noticia"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Noticias</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f4f6f9; margin: 20px; }
        table { width: 100%; border-collapse: collapse; background: white; box-shadow: 0 2px 5px rgba(0,0,0,0.1); font-size: 13px; }
        th, td { padding: 8px 10px; border: 1px solid #ddd; text-align: left; }
        th { background: #1f2d3d; color: white; }
        tr:nth-child(even) { background: #f9f9f9; }
        .top-bar { display: flex; justify-content: space-between; align-items: center; margin-bottom: 15px; }
        .btn { background: #0066cc; color: white; padding: 8px 14px; text-decoration: none; border-radius: 4px; font-size: 14px; }
    </style>
</head>
<body>
<div class="top-bar">
    <h2>Noticias Registradas</h2>
    <div>
        <a href="agregar.jsp" class="btn">Nueva Noticia</a>
        <a href="../../index.jsp" class="btn" style="background:#6c757d;">Inicio</a>
    </div>
</div>

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Categoría</th>
            <th>Fecha</th>
            <th>Ubicación</th>
            <th>Periodista</th>
            <th>Programa</th>
            <th>Emisión</th>
            <th>Público</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        <%
            List<Noticia> lista = (List<Noticia>) session.getAttribute("noticia.listar");
            if (lista != null && !lista.isEmpty()) {
                for (Noticia n : lista) {
        %>
        <tr>
            <td><%= n.getId() %></td>
            <td><%= n.getCategoria() %></td>
            <td><%= n.getFecha() %></td>
            <td><%= n.getCiudad() %>, <%= n.getDepartamento() %> (<%= n.getPais() %>)</td>
            <td><%= n.getPeriodista() %></td>
            <td><%= n.getProgramaEmite() %></td>
            <td><%= n.getFechaEmision() %></td>
            <td><%= n.getNivelPublico() %></td>
            <td>
                <a href="../../ServletNoticia?accion=buscar&txtId=<%= n.getId() %>">Ver / Editar</a> |
                <a href="../../ServletNoticia?accion=eliminar&txtId=<%= n.getId() %>" onclick="return confirm('¿Eliminar esta noticia?')">Eliminar</a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr><td colspan="9" style="text-align:center;">No hay noticias cargadas. <a href="../../ServletNoticia?accion=listar">Actualizar</a></td></tr>
        <% } %>
    </tbody>
</table>
</body>
</html>