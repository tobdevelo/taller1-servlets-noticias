<%@page import="modelo.Noticia"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Noticia n = (Noticia) session.getAttribute("noticia.buscar");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Eliminar Noticia</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f4f6f9; margin: 20px; }
        .card { background: white; padding: 25px; border-radius: 8px; max-width: 450px; margin: auto; box-shadow: 0 2px 5px rgba(0,0,0,0.1); text-align: center; }
        .danger { color: #d9534f; margin-top: 0; }
        button { background: #d9534f; color: white; border: none; padding: 10px 18px; border-radius: 4px; cursor: pointer; }
        a { color: #0066cc; text-decoration: none; margin-left: 10px; }
    </style>
</head>
<body>
<div class="card">
    <h2 class="danger">Confirmar Eliminación</h2>
    <% if (n != null) { %>
        <p>¿Está seguro de que desea eliminar la noticia <strong>#<%= n.getId() %> - <%= n.getCategoria() %></strong>?</p>
        <p><em>"<%= n.getDescripcion() %>"</em></p>
        <form action="../../ServletNoticia" method="POST">
            <input type="hidden" name="accion" value="eliminar">
            <input type="hidden" name="txtId" value="<%= n.getId() %>">
            <button type="submit">Sí, eliminar</button>
            <a href="../../ServletNoticia?accion=listar">Cancelar</a>
        </form>
    <% } else { %>
        <p>No se especificó ninguna noticia.</p>
        <a href="../../ServletNoticia?accion=listar">Volver al listado</a>
    <% } %>
</div>
</body>
</html>