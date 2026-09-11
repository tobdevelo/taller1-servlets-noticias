package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CRUDNoticia extends ConexionBaseDatos {

    public CRUDNoticia() throws Exception {
        super();
    }

    public boolean agregar(Noticia n) throws Exception {
        String sql = "INSERT INTO noticias (categoria, fecha, pais, departamento, ciudad, periodista, programaEmite, fechaEmision, descripcion, nivelPublico) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = crearSentencia(sql)) {
            ps.setString(1, n.getCategoria());
            ps.setDate(2, n.getFecha());
            ps.setString(3, n.getPais());
            ps.setString(4, n.getDepartamento());
            ps.setString(5, n.getCiudad());
            ps.setString(6, n.getPeriodista());
            ps.setString(7, n.getProgramaEmite());
            ps.setDate(8, n.getFechaEmision());
            ps.setString(9, n.getDescripcion());
            ps.setString(10, n.getNivelPublico());
            return actualizar(ps) > 0;
        }
    }

    public Noticia buscar(int id) throws Exception {
        String sql = "SELECT * FROM noticias WHERE id = ?";
        try (PreparedStatement ps = crearSentencia(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = consultar(ps)) {
                if (rs.next()) {
                    return mapearNoticia(rs);
                }
            }
        }
        return null;
    }

    public boolean modificar(Noticia n) throws Exception {
        String sql = "UPDATE noticias SET categoria = ?, fecha = ?, pais = ?, departamento = ?, ciudad = ?, periodista = ?, programaEmite = ?, fechaEmision = ?, descripcion = ?, nivelPublico = ? WHERE id = ?";
        try (PreparedStatement ps = crearSentencia(sql)) {
            ps.setString(1, n.getCategoria());
            ps.setDate(2, n.getFecha());
            ps.setString(3, n.getPais());
            ps.setString(4, n.getDepartamento());
            ps.setString(5, n.getCiudad());
            ps.setString(6, n.getPeriodista());
            ps.setString(7, n.getProgramaEmite());
            ps.setDate(8, n.getFechaEmision());
            ps.setString(9, n.getDescripcion());
            ps.setString(10, n.getNivelPublico());
            ps.setInt(11, n.getId());
            return actualizar(ps) > 0;
        }
    }

    public boolean eliminar(int id) throws Exception {
        String sql = "DELETE FROM noticias WHERE id = ?";
        try (PreparedStatement ps = crearSentencia(sql)) {
            ps.setInt(1, id);
            return actualizar(ps) > 0;
        }
    }

    public List<Noticia> listar() throws Exception {
        List<Noticia> lista = new ArrayList<>();
        String sql = "SELECT * FROM noticias ORDER BY fecha DESC";
        try (PreparedStatement ps = crearSentencia(sql);
             ResultSet rs = consultar(ps)) {
            while (rs.next()) {
                lista.add(mapearNoticia(rs));
            }
        }
        return lista;
    }

    // Reporte 1: Filtrar noticias por categoria
    public List<Noticia> reportePorCategoria(String categoria) throws Exception {
        List<Noticia> lista = new ArrayList<>();
        String sql = "SELECT * FROM noticias WHERE categoria = ? ORDER BY fecha DESC";
        try (PreparedStatement ps = crearSentencia(sql)) {
            ps.setString(1, categoria);
            try (ResultSet rs = consultar(ps)) {
                while (rs.next()) {
                    lista.add(mapearNoticia(rs));
                }
            }
        }
        return lista;
    }

    // Reporte 2: Filtrar noticias por periodista
    public List<Noticia> reportePorPeriodista(String periodista) throws Exception {
        List<Noticia> lista = new ArrayList<>();
        String sql = "SELECT * FROM noticias WHERE periodista LIKE ? ORDER BY fecha DESC";
        try (PreparedStatement ps = crearSentencia(sql)) {
            ps.setString(1, "%" + periodista + "%");
            try (ResultSet rs = consultar(ps)) {
                while (rs.next()) {
                    lista.add(mapearNoticia(rs));
                }
            }
        }
        return lista;
    }

    private Noticia mapearNoticia(ResultSet rs) throws Exception {
        return new Noticia(
                rs.getInt("id"),
                rs.getString("categoria"),
                rs.getDate("fecha"),
                rs.getString("pais"),
                rs.getString("departamento"),
                rs.getString("ciudad"),
                rs.getString("periodista"),
                rs.getString("programaEmite"),
                rs.getDate("fechaEmision"),
                rs.getString("descripcion"),
                rs.getString("nivelPublico")
        );
    }
}