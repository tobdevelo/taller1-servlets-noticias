<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario u = (Usuario) session.getAttribute("usuario.buscar");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Modificar Usuario</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f4f6f9; margin: 20px; }
        .card { background: white; padding: 25px; border-radius: 8px; max-width: 450px; margin: auto; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input, select { width: 100%; padding: 8px; box-sizing: border-box; }
        button { background: #ffc107; color: black; border: none; padding: 10px 15px; border-radius: 4px; cursor: pointer; font-weight: bold; }
        a { color: #0066cc; text-decoration: none; margin-left: 10px; }
    </style>
</head>
<body>
<div class="card">
    <h2>Modificar Usuario</h2>
    <% if (u != null) { %>
    <form action="../../ServletUsuario" method="POST">
        <input type="hidden" name="accion" value="modificar">
        <div class="form-group">
            <label>Identificación (ID):</label>
            <input type="text" name="txtId" value="<%= u.getId() %>" readonly style="background:#e9ecef;">
        </div>
        <div class="form-group">
            <label>Contraseña:</label>
            <input type="password" name="txtClave" value="<%= u.getClave() %>" required>
        </div>
        <div class="form-group">
            <label>Nombre Completo:</label>
            <input type="text" name="txtNombre" value="<%= u.getNombre() %>" required>
        </div>
        <div class="form-group">
            <label>Rol:</label>
            <select name="cboRol">
                <option value="Administrador" <%= "Administrador".equals(u.getRol()) ? "selected" : "" %>>Administrador</option>
                <option value="Editor" <%= "Editor".equals(u.getRol()) ? "selected" : "" %>>Editor</option>
                <option value="Periodista" <%= "Periodista".equals(u.getRol()) ? "selected" : "" %>>Periodista</option>
            </select>
        </div>
        <button type="submit">Actualizar</button>
        <a href="../../ServletUsuario?accion=listar">Volver</a>
    </form>
    <% } else { %>
        <p>No se ha seleccionado ningún usuario para modificar.</p>
        <a href="buscar.jsp">Buscar Usuario</a>
    <% } %>
</div>
</body>
</html>