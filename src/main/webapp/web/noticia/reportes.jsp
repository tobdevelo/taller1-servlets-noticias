<%@page import="java.util.List"%>
<%@page import="modelo.Noticia"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Reportes de Noticias</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f4f6f9; margin: 25px; }
        .grid { display: flex; gap: 20px; margin-bottom: 20px; }
        .card { background: white; padding: 20px; border-radius: 8px; flex: 1; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        table { width: 100%; border-collapse: collapse; background: white; margin-top: 15px; font-size: 13px; }
        th, td { padding: 10px; border: 1px solid #ddd; text-align: left; }
        th { background: #1f2d3d; color: white; }
        input, select, button { padding: 8px; }
        button { background: #0066cc; color: white; border: none; border-radius: 4px; cursor: pointer; }
    </style>
</head>
<body>
<h2>Consultas y Reportes Parametrizados: Noticias</h2>
<a href="../../index.jsp">Volver al Inicio</a>

<div class="grid" style="margin-top: 15px;">
    <div class="card">
        <h4>Reporte 1: Filtrar por Categoría</h4>
        <form action="../../ServletNoticia" method="GET">
            <input type="hidden" name="accion" value="reporteCategoria">
            <select name="cboCategoria">
                <option value="Politica">Política</option>
                <option value="Economia">Economía</option>
                <option value="Deportes">Deportes</option>
                <option value="Tecnologia">Tecnología</option>
                <option value="Cultura">Cultura</option>
            </select>
            <button type="submit">Filtrar</button>
        </form>
    </div>

    <div class="card">
        <h4>Reporte 2: Filtrar por Periodista</h4>
        <form action="../../ServletNoticia" method="GET">
            <input type="hidden" name="accion" value="reportePeriodista">
            <input type="text" name="txtPeriodista" placeholder="Nombre del periodista..." required>
            <button type="submit">Buscar</button>
        </form>
    </div>
</div>

<%
    List<Noticia> resultados = (List<Noticia>) request.getAttribute("resultadoReporte");
    if (resultados != null) {
%>
<h3>Resultados del Reporte</h3>
<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Categoría</th>
            <th>Fecha</th>
            <th>Ciudad</th>
            <th>Periodista</th>
            <th>Programa</th>
            <th>Público</th>
            <th>Descripción</th>
        </tr>
    </thead>
    <tbody>
        <% if (resultados.isEmpty()) { %>
            <tr><td colspan="8" style="text-align:center;">No se encontraron noticias con los parámetros indicados.</td></tr>
        <% } else {
            for (Noticia noti : resultados) { %>
            <tr>
                <td><%= noti.getId() %></td>
                <td><%= noti.getCategoria() %></td>
                <td><%= noti.getFecha() %></td>
                <td><%= noti.getCiudad() %></td>
                <td><%= noti.getPeriodista() %></td>
                <td><%= noti.getProgramaEmite() %></td>
                <td><%= noti.getNivelPublico() %></td>
                <td><%= noti.getDescripcion() %></td>
            </tr>
        <%  }
           } %>
    </tbody>
</table>
<% } %>
</body>
</html>