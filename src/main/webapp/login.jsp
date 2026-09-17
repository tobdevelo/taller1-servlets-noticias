
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Iniciar Sesión - Sistema de Noticias</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f4f6f9; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .card { background: #fff; padding: 30px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); width: 340px; }
        h2 { text-align: center; color: #333; margin-top: 0; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; font-size: 14px; }
        input[type="text"], input[type="password"] { width: 100%; padding: 9px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 4px; }
        button { width: 100%; padding: 10px; background: #0066cc; color: white; border: none; border-radius: 4px; font-size: 16px; cursor: pointer; }
        button:hover { background: #004d99; }
        .error { color: #d9534f; background: #fdf2f2; padding: 10px; border-radius: 4px; margin-bottom: 15px; font-size: 13px; text-align: center; }
    </style>
</head>
<body>
<div class="card">
    <h2>Acceso al Sistema</h2>
    <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
        <div class="error"><%= error %></div>
    <%
        }
    %>
    <form action="ServletUsuario" method="POST">
        <input type="hidden" name="accion" value="login">
        <div class="form-group">
            <label for="txtId">Identificación:</label>
            <input type="text" id="txtId" name="txtId" required autocomplete="off">
        </div>
        <div class="form-group">
            <label for="txtClave">Contraseña:</label>
            <input type="password" id="txtClave" name="txtClave" required>
        </div>
        <button type="submit">Ingresar</button>
    </form>
</div>
</body>
</html>
