<%@page import="modelo.Noticia"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Noticia n = (Noticia) session.getAttribute("noticia.buscar");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Modificar Noticia</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f4f6f9; margin: 20px; }
        .card { background: #fff; padding: 25px; border-radius: 8px; max-width: 650px; margin: auto; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        .form-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 15px; }
        .full-width { grid-column: span 2; }
        label { display: block; margin-bottom: 5px; font-weight: bold; font-size: 13px; }
        input, select, textarea { width: 100%; padding: 8px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 4px; }
        button { background: #ffc107; color: black; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer; font-size: 15px; font-weight: bold; margin-top: 15px; }
        a { color: #0066cc; text-decoration: none; margin-left: 15px; }
    </style>
</head>
<body>
<div class="card">
    <h2>Modificar Noticia</h2>
    <% if (n != null) { %>
    <form action="../../ServletNoticia" method="POST">
        <input type="hidden" name="accion" value="modificar">
        <input type="hidden" name="txtId" value="<%= n.getId() %>">

        <div class="form-grid">
            <div>
                <label>Categoría:</label>
                <select name="txtCategoria">
                    <option value="Politica" <%= "Politica".equals(n.getCategoria()) ? "selected" : "" %>>Política</option>
                    <option value="Economia" <%= "Economia".equals(n.getCategoria()) ? "selected" : "" %>>Economía</option>
                    <option value="Deportes" <%= "Deportes".equals(n.getCategoria()) ? "selected" : "" %>>Deportes</option>
                    <option value="Tecnologia" <%= "Tecnologia".equals(n.getCategoria()) ? "selected" : "" %>>Tecnología</option>
                    <option value="Cultura" <%= "Cultura".equals(n.getCategoria()) ? "selected" : "" %>>Cultura</option>
                </select>
            </div>
            <div>
                <label>Fecha del Suceso:</label>
                <input type="date" name="txtFecha" value="<%= n.getFecha() %>" required>
            </div>
            <div>
                <label>País:</label>
                <input type="text" name="txtPais" value="<%= n.getPais() %>" required>
            </div>
            <div>
                <label>Departamento / Estado:</label>
                <input type="text" name="txtDepartamento" value="<%= n.getDepartamento() %>" required>
            </div>
            <div>
                <label>Ciudad:</label>
                <input type="text" name="txtCiudad" value="<%= n.getCiudad() %>" required>
            </div>
            <div>
                <label>Periodista:</label>
                <input type="text" name="txtPeriodista" value="<%= n.getPeriodista() %>" required>
            </div>
            <div>
                <label>Programa que Emite:</label>
                <input type="text" name="txtProgramaEmite" value="<%= n.getProgramaEmite() %>" required>
            </div>
            <div>
                <label>Fecha de Emisión:</label>
                <input type="date" name="txtFechaEmision" value="<%= n.getFechaEmision() %>" required>
            </div>
            <div class="full-width">
                <label>Nivel de Público:</label>
                <select name="txtNivelPublico">
                    <option value="General" <%= "General".equals(n.getNivelPublico()) ? "selected" : "" %>>General</option>
                    <option value="Infantil" <%= "Infantil".equals(n.getNivelPublico()) ? "selected" : "" %>>Infantil</option>
                    <option value="Juvenil" <%= "Juvenil".equals(n.getNivelPublico()) ? "selected" : "" %>>Juvenil</option>
                    <option value="Adultos" <%= "Adultos".equals(n.getNivelPublico()) ? "selected" : "" %>>Adultos</option>
                    <option value="Especializado" <%= "Especializado".equals(n.getNivelPublico()) ? "selected" : "" %>>Especializado</option>
                </select>
            </div>
            <div class="full-width">
                <label>Descripción / Contenido:</label>
                <textarea name="txtDescripcion" rows="4" required><%= n.getDescripcion() %></textarea>
            </div>
        </div>
        <button type="submit">Actualizar Noticia</button>
        <a href="../../ServletNoticia?accion=listar">Volver</a>
    </form>
    <% } else { %>
        <p>No hay noticia seleccionada para modificar. <a href="buscar.jsp">Buscar primero</a></p>
    <% } %>
</div>
</body>
</html>