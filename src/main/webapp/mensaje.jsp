<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Notificación del Sistema</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f4f6f9; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .card { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); width: 400px; text-align: center; }
        .error-title { color: #d9534f; margin-top: 0; }
        .btn { display: inline-block; margin-top: 15px; padding: 8px 16px; background: #0066cc; color: white; text-decoration: none; border-radius: 4px; }
    </style>
</head>
<body>
<div class="card">
    <h2 class="error-title">Aviso del Sistema</h2>
    <p><%= request.getAttribute("error") != null ? request.getAttribute("error") : "Operación procesada con éxito." %></p>
    <a href="index.jsp" class="btn">Volver al Inicio</a>
</div>
</body>
</html>