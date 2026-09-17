<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario u = (Usuario) session.getAttribute("usuario.buscar");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Buscar y Modificar Usuario</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f4f6f9; margin: 20px; }
        .card { background: white; padding: 25px; border-radius: 8px; max-width: 450px; margin: 15px auto; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        .form-group { margin-bottom: 12px; }
        label { display: block; margin-bottom: 4px; font-weight: bold; }
        input, select { width: 100%; padding: 8px; box-sizing: border-box; }
        button { background: #0066cc; color: white; border: none; padding: 8px 14px; border-radius: 4px; cursor: pointer; }
    </style>
</head>
<body>
<div class="card">
    <h3>Buscar por ID</h3>
    <form action="../../ServletUsuario" method="GET">
        <input type="hidden" name="accion" value="buscar">
        <div class="form-group">
            <input type="text" name="txtId" placeholder="Ingrese ID de usuario" required>
        </div>
        <button type="submit">Buscar</button>
        <a href="../../index.jsp" style="margin-left:10px;">Inicio</a>
    </form>
</div>

<% if (u != null) { %>
<div class="card">
    <h3>Modificar Usuario</h3>
    <form action="../../ServletUsuario" method="POST">
        <input type="hidden" name="accion" value="modificar">
        <div class="form-group">
            <label>ID (No editable):</label>
            <input type="text" name="txtId" value="<%= u.getId() %>" readonly style="background:#e9ecef;">
        </div>
        <div class="form-group">
            <label>Contraseña:</label>
            <input type="text" name="txtClave" value="<%= u.getClave() %>" required>
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
        <button type="submit" style="background:#ffc107; color:black;">Guardar Cambios</button>
    </form>
</div>
<% } %>
</body>
</html>