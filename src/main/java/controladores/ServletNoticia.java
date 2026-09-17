package controladores;

import modelo.CRUDNoticia;
import modelo.Noticia;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet(name = "ServletNoticia", urlPatterns = {"/ServletNoticia"})
public class ServletNoticia extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String accion = request.getParameter("accion");
        HttpSession sesion = request.getSession();

        try {
            CRUDNoticia crud = new CRUDNoticia();

            if (accion == null || accion.isEmpty()) {
                response.sendRedirect("ServletNoticia?accion=listar");
                return;
            }

            switch (accion) {
                case "listar": {
                    List<Noticia> lista = crud.listar();
                    sesion.setAttribute("noticia.listar", lista);
                    response.sendRedirect("web/noticia/listar.jsp");
                    break;
                }

                case "agregar": {
                    String categoria = request.getParameter("txtCategoria");
                    Date fecha = Date.valueOf(request.getParameter("txtFecha"));
                    String pais = request.getParameter("txtPais");
                    String departamento = request.getParameter("txtDepartamento");
                    String ciudad = request.getParameter("txtCiudad");
                    String periodista = request.getParameter("txtPeriodista");
                    String programaEmite = request.getParameter("txtProgramaEmite");
                    Date fechaEmision = Date.valueOf(request.getParameter("txtFechaEmision"));
                    String descripcion = request.getParameter("txtDescripcion");
                    String nivelPublico = request.getParameter("txtNivelPublico");

                    Noticia n = new Noticia(categoria, fecha, pais, departamento, ciudad, periodista, programaEmite, fechaEmision, descripcion, nivelPublico);
                    crud.agregar(n);
                    response.sendRedirect("ServletNoticia?accion=listar");
                    break;
                }

                case "buscar": {
                    int id = Integer.parseInt(request.getParameter("txtId"));
                    Noticia n = crud.buscar(id);
                    sesion.setAttribute("noticia.buscar", n);
                    response.sendRedirect("web/noticia/buscar.jsp");
                    break;
                }

                case "modificar": {
                    int id = Integer.parseInt(request.getParameter("txtId"));
                    String categoria = request.getParameter("txtCategoria");
                    Date fecha = Date.valueOf(request.getParameter("txtFecha"));
                    String pais = request.getParameter("txtPais");
                    String departamento = request.getParameter("txtDepartamento");
                    String ciudad = request.getParameter("txtCiudad");
                    String periodista = request.getParameter("txtPeriodista");
                    String programaEmite = request.getParameter("txtProgramaEmite");
                    Date fechaEmision = Date.valueOf(request.getParameter("txtFechaEmision"));
                    String descripcion = request.getParameter("txtDescripcion");
                    String nivelPublico = request.getParameter("txtNivelPublico");

                    Noticia n = new Noticia(id, categoria, fecha, pais, departamento, ciudad, periodista, programaEmite, fechaEmision, descripcion, nivelPublico);
                    crud.modificar(n);
                    response.sendRedirect("ServletNoticia?accion=listar");
                    break;
                }

                case "eliminar": {
                    int id = Integer.parseInt(request.getParameter("txtId"));
                    crud.eliminar(id);
                    response.sendRedirect("ServletNoticia?accion=listar");
                    break;
                }

                case "reporteCategoria": {
                    String categoria = request.getParameter("cboCategoria");
                    List<Noticia> lista = crud.reportePorCategoria(categoria);
                    request.setAttribute("resultadoReporte", lista);
                    request.getRequestDispatcher("web/noticia/reportes.jsp").forward(request, response);
                    break;
                }

                case "reportePeriodista": {
                    String periodista = request.getParameter("txtPeriodista");
                    List<Noticia> lista = crud.reportePorPeriodista(periodista);
                    request.setAttribute("resultadoReporte", lista);
                    request.getRequestDispatcher("web/noticia/reportes.jsp").forward(request, response);
                    break;
                }

                default:
                    response.sendRedirect("index.jsp");
                    break;
            }

        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("mensaje.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}