<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registrar Usuario</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f4f6f9; margin: 20px; }
        .card { background: #fff; padding: 25px; border-radius: 8px; max-width: 450px; margin: auto; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input, select { width: 100%; padding: 8px; box-sizing: border-box; }
        button { background: #28a745; color: white; border: none; padding: 10px 15px; border-radius: 4px; cursor: pointer; }
        a { color: #0066cc; text-decoration: none; margin-left: 10px; }
    </style>
</head>
<body>
<div class="card">
    <h2>Registrar Nuevo Usuario</h2>
    <form action="../../ServletUsuario" method="POST">
        <input type="hidden" name="accion" value="agregar">
        <div class="form-group">
            <label>Identificación (ID):</label>
            <input type="text" name="txtId" required>
        </div>
        <div class="form-group">
            <label>Contraseña:</label>
            <input type="password" name="txtClave" required>
        </div>
        <div class="form-group">
            <label>Nombre Completo:</label>
            <input type="text" name="txtNombre" required>
        </div>
        <div class="form-group">
            <label>Rol:</label>
            <select name="cboRol">
                <option value="Administrador">Administrador</option>
                <option value="Editor">Editor</option>
                <option value="Periodista">Periodista</option>
            </select>
        </div>
        <button type="submit">Guardar</button>
        <a href="../../index.jsp">Volver</a>
    </form>
</div>
</body>
</html>