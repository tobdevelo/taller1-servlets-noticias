package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConexionBaseDatos {

    // Atributos de conexion segun la guia
    protected String driver = "com.mysql.cj.jdbc.Driver";
    protected String nombreIPServidorBD = "localhost";
    protected String url = "jdbc:mysql://";
    protected int puertoServidorBD = 3306;
    protected String usuarioBD = "root";
    protected String passwordUsuarioBD = "admin";
    protected String nombreBD = "bd_noticias";

    private Connection conexion;
    private PreparedStatement sentencia;
    private ResultSet filasConsulta;

    public ConexionBaseDatos() throws Exception {
        // Si existen variables en el entorno (Railway), las toma; si no, deja los valores locales por defecto
        String envHost = System.getenv("MYSQLHOST");
        String envPort = System.getenv("MYSQLPORT");
        String envDB   = System.getenv("MYSQLDATABASE");
        String envUser = System.getenv("MYSQLUSER");
        String envPass = System.getenv("MYSQLPASSWORD");

        if (envHost != null && !envHost.isEmpty()) {
            this.nombreIPServidorBD = envHost;
        }
        if (envPort != null && !envPort.isEmpty()) {
            this.puertoServidorBD = Integer.parseInt(envPort);
        }
        if (envDB != null && !envDB.isEmpty()) {
            this.nombreBD = envDB;
        }
        if (envUser != null && !envUser.isEmpty()) {
            this.usuarioBD = envUser;
        }
        if (envPass != null) {
            this.passwordUsuarioBD = envPass;
        }

        this.url = this.url + this.nombreIPServidorBD + ":" + this.puertoServidorBD + "/" + this.nombreBD + "?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
        this.conectar();
    }

    public ConexionBaseDatos(String driver, String servidor, String url, String usuarioBD, String passwordUsuarioBD, String nombreBD) throws Exception {
        this.driver = driver;
        this.nombreIPServidorBD = servidor;
        this.url = url;
        this.usuarioBD = usuarioBD;
        this.passwordUsuarioBD = passwordUsuarioBD;
        this.nombreBD = nombreBD;
        this.conectar();
    }

    public void conectar() throws Exception {
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException ex) {
            throw new Exception("Error de Driver: " + ex.getMessage());
        }
        try {
            conexion = DriverManager.getConnection(url, usuarioBD, passwordUsuarioBD);
        } catch (SQLException ex) {
            throw new Exception("Error de Conexion. Codigo: " + ex.getErrorCode() + " Explicacion: " + ex.getMessage());
        }
    }

    public int actualizar(PreparedStatement sentencia) throws Exception {
        try {
            return sentencia.executeUpdate();
        } catch (SQLException ex) {
            throw new SQLException("Error al ejecutar sentencia BD Conexion. Codigo: " + ex.getErrorCode() + " Explicacion: " + ex.getMessage());
        }
    }

    public ResultSet consultar(PreparedStatement sentencia) throws Exception {
        try {
            filasConsulta = sentencia.executeQuery();
            return filasConsulta;
        } catch (SQLException ex) {
            throw new SQLException("Error al ejecutar sentencia BD Conexion: " + ex.getMessage());
        }
    }

    public void desconectar() {
        try {
            if (conexion != null && !conexion.isClosed()) {
                conexion.close();
            }
        } catch (SQLException ex) {
            conexion = null;
        }
    }

    public PreparedStatement crearSentencia(String sql) throws Exception {
        try {
            sentencia = conexion.prepareStatement(sql);
            return sentencia;
        } catch (SQLException ex) {
            throw new SQLException("Error de Sentencia DB. Codigo: " + ex.getErrorCode() + " Explicacion: " + ex.getMessage());
        }
    }

    // Getters y Setters
    public Connection getConexion() { return conexion; }
    public void setConexion(Connection conexion) { this.conexion = conexion; }
    public String getDriver() { return driver; }
    public void setDriver(String driver) { this.driver = driver; }
    public ResultSet getFilasConsulta() { return filasConsulta; }
    public void setFilasConsulta(ResultSet filasConsulta) { this.filasConsulta = filasConsulta; }
    public String getNombreBD() { return nombreBD; }
    public void setNombreBD(String nombreBD) { this.nombreBD = nombreBD; }
    public String getNombreIPServidorBD() { return nombreIPServidorBD; }
    public void setNombreIPServidorBD(String nombreIPServidorBD) { this.nombreIPServidorBD = nombreIPServidorBD; }
    public String getPasswordUsuarioBD() { return passwordUsuarioBD; }
    public void setPasswordUsuarioBD(String passwordUsuarioBD) { this.passwordUsuarioBD = passwordUsuarioBD; }
    public int getPuertoServidorBD() { return puertoServidorBD; }
    public void setPuertoServidorBD(int puertoServidorBD) { this.puertoServidorBD = puertoServidorBD; }
    public PreparedStatement getSentencia() { return sentencia; }
    public void setSentencia(PreparedStatement sentencia) { this.sentencia = sentencia; }
    public String getUrl() { return url; }
    public void setUrl(String url) { this.url = url; }
    public String getUsuarioBD() { return usuarioBD; }
    public void setUsuarioBD(String usuarioBD) { this.usuarioBD = usuarioBD; }
}