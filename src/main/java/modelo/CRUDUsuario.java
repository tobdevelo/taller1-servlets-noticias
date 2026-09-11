package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CRUDUsuario extends ConexionBaseDatos {

    public CRUDUsuario() throws Exception {
        super();
    }

    public boolean agregar(Usuario u) throws Exception {
        String sql = "INSERT INTO usuarios (id, clave, nombre, rol) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = crearSentencia(sql)) {
            ps.setString(1, u.getId());
            ps.setString(2, u.getClave());
            ps.setString(3, u.getNombre());
            ps.setString(4, u.getRol());
            return actualizar(ps) > 0;
        }
    }

    public Usuario buscar(String id) throws Exception {
        String sql = "SELECT id, clave, nombre, rol FROM usuarios WHERE id = ?";
        try (PreparedStatement ps = crearSentencia(sql)) {
            ps.setString(1, id);
            try (ResultSet rs = consultar(ps)) {
                if (rs.next()) {
                    return new Usuario(
                            rs.getString("id"),
                            rs.getString("clave"),
                            rs.getString("nombre"),
                            rs.getString("rol")
                    );
                }
            }
        }
        return null;
    }

    public boolean modificar(Usuario u) throws Exception {
        String sql = "UPDATE usuarios SET clave = ?, nombre = ?, rol = ? WHERE id = ?";
        try (PreparedStatement ps = crearSentencia(sql)) {
            ps.setString(1, u.getClave());
            ps.setString(2, u.getNombre());
            ps.setString(3, u.getRol());
            ps.setString(4, u.getId());
            return actualizar(ps) > 0;
        }
    }

    public boolean eliminar(String id) throws Exception {
        String sql = "DELETE FROM usuarios WHERE id = ?";
        try (PreparedStatement ps = crearSentencia(sql)) {
            ps.setString(1, id);
            return actualizar(ps) > 0;
        }
    }

    public List<Usuario> listar() throws Exception {
        List<Usuario> lista = new ArrayList<>();
        String sql = "SELECT id, clave, nombre, rol FROM usuarios ORDER BY nombre ASC";
        try (PreparedStatement ps = crearSentencia(sql);
             ResultSet rs = consultar(ps)) {
            while (rs.next()) {
                lista.add(new Usuario(
                        rs.getString("id"),
                        rs.getString("clave"),
                        rs.getString("nombre"),
                        rs.getString("rol")
                ));
            }
        }
        return lista;
    }

    // Consulta de autenticacion (Login)
    public Usuario autenticar(String id, String clave) throws Exception {
        String sql = "SELECT id, clave, nombre, rol FROM usuarios WHERE id = ? AND clave = ?";
        try (PreparedStatement ps = crearSentencia(sql)) {
            ps.setString(1, id);
            ps.setString(2, clave);
            try (ResultSet rs = consultar(ps)) {
                if (rs.next()) {
                    return new Usuario(
                            rs.getString("id"),
                            rs.getString("clave"),
                            rs.getString("nombre"),
                            rs.getString("rol")
                    );
                }
            }
        }
        return null;
    }

    // Reporte 1: Filtrar usuarios por rol
    public List<Usuario> reportePorRol(String rol) throws Exception {
        List<Usuario> lista = new ArrayList<>();
        String sql = "SELECT id, clave, nombre, rol FROM usuarios WHERE rol = ? ORDER BY nombre ASC";
        try (PreparedStatement ps = crearSentencia(sql)) {
            ps.setString(1, rol);
            try (ResultSet rs = consultar(ps)) {
                while (rs.next()) {
                    lista.add(new Usuario(
                            rs.getString("id"),
                            rs.getString("clave"),
                            rs.getString("nombre"),
                            rs.getString("rol")
                    ));
                }
            }
        }
        return lista;
    }

    // Reporte 2: Buscar usuarios cuyo nombre contenga un texto
    public List<Usuario> reportePorCoincidenciaNombre(String filtro) throws Exception {
        List<Usuario> lista = new ArrayList<>();
        String sql = "SELECT id, clave, nombre, rol FROM usuarios WHERE nombre LIKE ? ORDER BY nombre ASC";
        try (PreparedStatement ps = crearSentencia(sql)) {
            ps.setString(1, "%" + filtro + "%");
            try (ResultSet rs = consultar(ps)) {
                while (rs.next()) {
                    lista.add(new Usuario(
                            rs.getString("id"),
                            rs.getString("clave"),
                            rs.getString("nombre"),
                            rs.getString("rol")
                    ));
                }
            }
        }
        return lista;
    }
}