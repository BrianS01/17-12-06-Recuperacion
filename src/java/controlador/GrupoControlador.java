/*
 *      Author ::: Brian Sterling
 *     Program ::: Bases de Datos
 *  Credential ::: SIST0008-G01:SIV
 */

package controlador;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.ConsultorDAO;
import modelo.Consultor;

public class GrupoControlador extends HttpServlet
{
    private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT = "/consultor.jsp";
    private static String LIST_USER = "/consultorListar.jsp";
    private ConsultorDAO dao;

    public GrupoControlador()
    {
        super();
        dao = new ConsultorDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String forward = "";
        String action = request.getParameter("action");
        
        if (action.equalsIgnoreCase("delete"))
        {
            int userId = Integer.parseInt(request.getParameter("idConsultor"));
            dao.deleteUser(userId);
            forward = LIST_USER;
            request.setAttribute("consultor", dao.getAllUsers());
        }
        else if (action.equalsIgnoreCase("edit"))
        {
            forward = INSERT_OR_EDIT;
            int userId = Integer.parseInt(request.getParameter("idConsultor"));
            Consultor user = dao.getUserById(userId);
            request.setAttribute("user", user);
        }
        else if (action.equalsIgnoreCase("listUser"))
        {
            forward = LIST_USER;
            request.setAttribute("consultor", dao.getAllUsers());
        }
        else
        {
            forward = INSERT_OR_EDIT;
        }

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        Consultor user = new Consultor();
        user.setLabor(request.getParameter("labor"));
        
        String userid = request.getParameter("idConsultor");
        
        if (userid == null || userid.isEmpty())
        {
            dao.addUser(user);
        }
        else
        {
            user.setIdConsultor(Integer.parseInt(userid));
            dao.updateUser(user);
        }

        RequestDispatcher view = request.getRequestDispatcher(LIST_USER);
        request.setAttribute("consultor", dao.getAllUsers());
        view.forward(request, response);
    }
}