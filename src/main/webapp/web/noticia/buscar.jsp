<%@page import="modelo.Noticia"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Noticia n = (Noticia) session.getAttribute("noticia.buscar");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Buscar Noticia</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f4f6f9; margin: 20px; }
        .card { background: white; padding: 25px; border-radius: 8px; max-width: 600px; margin: 15px auto; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        .form-group { margin-bottom: 12px; }
        input, button { padding: 8px; }
        button { background: #0066cc; color: white; border: none; border-radius: 4px; cursor: pointer; }
    </style>
</head>
<body>
<div class="card">
    <h3>Buscar Noticia por ID</h3>
    <form action="../../ServletNoticia" method="GET">
        <input type="hidden" name="accion" value="buscar">
        <div class="form-group">
            <input type="number" name="txtId" placeholder="ID de la noticia" required style="width:70%;">
            <button type="submit">Buscar</button>
            <a href="../../index.jsp" style="margin-left:10px;">Inicio</a>
        </div>
    </form>
</div>

<% if (n != null) { %>
<div class="card">
    <h3>Detalle de la Noticia #<%= n.getId() %></h3>
    <p><strong>Categoría:</strong> <%= n.getCategoria() %></p>
    <p><strong>Fecha:</strong> <%= n.getFecha() %></p>
    <p><strong>Lugar:</strong> <%= n.getCiudad() %>, <%= n.getDepartamento() %>, <%= n.getPais() %></p>
    <p><strong>Periodista:</strong> <%= n.getPeriodista() %></p>
    <p><strong>Programa:</strong> <%= n.getProgramaEmite() %> (Emisión: <%= n.getFechaEmision() %>)</p>
    <p><strong>Nivel de Público:</strong> <%= n.getNivelPublico() %></p>
    <p><strong>Descripción:</strong> <%= n.getDescripcion() %></p>
    <br>
    <a href="modificar.jsp" style="background:#ffc107; padding:8px 12px; text-decoration:none; color:black; border-radius:4px;">Editar</a>
    <a href="eliminar.jsp" style="background:#d9534f; padding:8px 12px; text-decoration:none; color:white; border-radius:4px; margin-left:10px;">Eliminar</a>
</div>
<% } %>
</body>
</html>