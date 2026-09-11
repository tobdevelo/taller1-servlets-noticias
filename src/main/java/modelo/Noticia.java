package modelo;

import java.sql.Date;

public class Noticia {
    private int id;
    private String categoria;
    private Date fecha;
    private String pais;
    private String departamento;
    private String ciudad;
    private String periodista;
    private String programaEmite;
    private Date fechaEmision;
    private String descripcion;
    private String nivelPublico;

    public Noticia() {
    }

    public Noticia(int id, String categoria, Date fecha, String pais, String departamento, String ciudad,
                   String periodista, String programaEmite, Date fechaEmision, String descripcion, String nivelPublico) {
        this.id = id;
        this.categoria = categoria;
        this.fecha = fecha;
        this.pais = pais;
        this.departamento = departamento;
        this.ciudad = ciudad;
        this.periodista = periodista;
        this.programaEmite = programaEmite;
        this.fechaEmision = fechaEmision;
        this.descripcion = descripcion;
        this.nivelPublico = nivelPublico;
    }

    public Noticia(String categoria, Date fecha, String pais, String departamento, String ciudad,
                   String periodista, String programaEmite, Date fechaEmision, String descripcion, String nivelPublico) {
        this.categoria = categoria;
        this.fecha = fecha;
        this.pais = pais;
        this.departamento = departamento;
        this.ciudad = ciudad;
        this.periodista = periodista;
        this.programaEmite = programaEmite;
        this.fechaEmision = fechaEmision;
        this.descripcion = descripcion;
        this.nivelPublico = nivelPublico;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getCategoria() { return categoria; }
    public void setCategoria(String categoria) { this.categoria = categoria; }
    public Date getFecha() { return fecha; }
    public void setFecha(Date fecha) { this.fecha = fecha; }
    public String getPais() { return pais; }
    public void setPais(String pais) { this.pais = pais; }
    public String getDepartamento() { return departamento; }
    public void setDepartamento(String departamento) { this.departamento = departamento; }
    public String getCiudad() { return ciudad; }
    public void setCiudad(String ciudad) { this.ciudad = ciudad; }
    public String getPeriodista() { return periodista; }
    public void setPeriodista(String periodista) { this.periodista = periodista; }
    public String getProgramaEmite() { return programaEmite; }
    public void setProgramaEmite(String programaEmite) { this.programaEmite = programaEmite; }
    public Date getFechaEmision() { return fechaEmision; }
    public void setFechaEmision(Date fechaEmision) { this.fechaEmision = fechaEmision; }
    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }
    public String getNivelPublico() { return nivelPublico; }
    public void setNivelPublico(String nivelPublico) { this.nivelPublico = nivelPublico; }
}