<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registrar Noticia</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f4f6f9; margin: 20px; }
        .card { background: #fff; padding: 25px; border-radius: 8px; max-width: 650px; margin: auto; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        .form-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 15px; }
        .full-width { grid-column: span 2; }
        label { display: block; margin-bottom: 5px; font-weight: bold; font-size: 13px; }
        input, select, textarea { width: 100%; padding: 8px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 4px; }
        button { background: #28a745; color: white; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer; font-size: 15px; margin-top: 15px; }
        a { color: #0066cc; text-decoration: none; margin-left: 15px; }
    </style>
</head>
<body>
<div class="card">
    <h2>Registrar Nueva Noticia</h2>
    <form action="../../ServletNoticia" method="POST">
        <input type="hidden" name="accion" value="agregar">
        <div class="form-grid">
            <div>
                <label>Categoría:</label>
                <select name="txtCategoria" required>
                    <option value="Politica">Política</option>
                    <option value="Economia">Economía</option>
                    <option value="Deportes">Deportes</option>
                    <option value="Tecnologia">Tecnología</option>
                    <option value="Cultura">Cultura</option>
                </select>
            </div>
            <div>
                <label>Fecha del Suceso:</label>
                <input type="date" name="txtFecha" required>
            </div>
            <div>
                <label>País:</label>
                <input type="text" name="txtPais" required>
            </div>
            <div>
                <label>Departamento / Estado:</label>
                <input type="text" name="txtDepartamento" required>
            </div>
            <div>
                <label>Ciudad:</label>
                <input type="text" name="txtCiudad" required>
            </div>
            <div>
                <label>Periodista:</label>
                <input type="text" name="txtPeriodista" required>
            </div>
            <div>
                <label>Programa que Emite:</label>
                <input type="text" name="txtProgramaEmite" required>
            </div>
            <div>
                <label>Fecha de Emisión:</label>
                <input type="date" name="txtFechaEmision" required>
            </div>
            <div class="full-width">
                <label>Nivel de Público:</label>
                <select name="txtNivelPublico" required>
                    <option value="General">General</option>
                    <option value="Infantil">Infantil</option>
                    <option value="Juvenil">Juvenil</option>
                    <option value="Adultos">Adultos</option>
                    <option value="Especializado">Especializado</option>
                </select>
            </div>
            <div class="full-width">
                <label>Descripción / Contenido:</label>
                <textarea name="txtDescripcion" rows="4" required></textarea>
            </div>
        </div>
        <button type="submit">Guardar Noticia</button>
        <a href="../../index.jsp">Volver</a>
    </form>
</div>
</body>
</html>