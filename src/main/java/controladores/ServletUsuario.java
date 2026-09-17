package controladores;

import modelo.CRUDUsuario;
import modelo.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServletUsuario", urlPatterns = {"/ServletUsuario"})
public class ServletUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String accion = request.getParameter("accion");
        HttpSession sesion = request.getSession();

        try {
            CRUDUsuario crud = new CRUDUsuario();

            if (accion == null || accion.isEmpty()) {
                response.sendRedirect("index.jsp");
                return;
            }

            switch (accion) {
                case "login": {
                    String id = request.getParameter("txtId");
                    String clave = request.getParameter("txtClave");
                    Usuario u = crud.autenticar(id, clave);

                    if (u != null) {
                        sesion.setAttribute("usuario.login", u);
                        response.sendRedirect("index.jsp");
                    } else {
                        request.setAttribute("error", "Credenciales invalidas. Verifique ID y clave.");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }
                    break;
                }

                case "logout": {
                    sesion.invalidate();
                    response.sendRedirect("login.jsp");
                    break;
                }

                case "listar": {
                    List<Usuario> lista = crud.listar();
                    sesion.setAttribute("usuario.listar", lista);
                    response.sendRedirect("web/usuario/listar.jsp");
                    break;
                }

                case "agregar": {
                    String id = request.getParameter("txtId");
                    String clave = request.getParameter("txtClave");
                    String nombre = request.getParameter("txtNombre");
                    String rol = request.getParameter("cboRol");

                    Usuario u = new Usuario(id, clave, nombre, rol);
                    crud.agregar(u);
                    response.sendRedirect("ServletUsuario?accion=listar");
                    break;
                }

                case "buscar": {
                    String id = request.getParameter("txtId");
                    Usuario u = crud.buscar(id);
                    sesion.setAttribute("usuario.buscar", u);
                    response.sendRedirect("web/usuario/buscar.jsp");
                    break;
                }

                case "modificar": {
                    String id = request.getParameter("txtId");
                    String clave = request.getParameter("txtClave");
                    String nombre = request.getParameter("txtNombre");
                    String rol = request.getParameter("cboRol");

                    Usuario u = new Usuario(id, clave, nombre, rol);
                    crud.modificar(u);
                    response.sendRedirect("ServletUsuario?accion=listar");
                    break;
                }

                case "eliminar": {
                    String id = request.getParameter("txtId");
                    crud.eliminar(id);
                    response.sendRedirect("ServletUsuario?accion=listar");
                    break;
                }

                case "reporteRol": {
                    String rol = request.getParameter("cboRol");
                    List<Usuario> lista = crud.reportePorRol(rol);
                    request.setAttribute("resultadoReporte", lista);
                    request.getRequestDispatcher("web/usuario/reportes.jsp").forward(request, response);
                    break;
                }

                case "reporteNombre": {
                    String filtro = request.getParameter("txtFiltro");
                    List<Usuario> lista = crud.reportePorCoincidenciaNombre(filtro);
                    request.setAttribute("resultadoReporte", lista);
                    request.getRequestDispatcher("web/usuario/reportes.jsp").forward(request, response);
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
