/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BewareServlet;

import BewareBean.Tag_task;
import BewareDatabase.TagDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mystery-PC
 */
@WebServlet(name = "DeleteTagServlet", urlPatterns = {"/DeleteTagServlet"})
public class DeleteTagServlet extends HttpServlet{

    private TagDao tagDao = new TagDao();
    public void init() throws ServletException {
        tagDao = new TagDao();
    }
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TaskServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TaskServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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

        HttpSession session = request.getSession();
        
        int tagID = Integer.parseInt(request.getParameter("tag"));
        int taskID = Integer.parseInt(request.getParameter("taskid"));
        
        Tag_task tag_task = new Tag_task();
        tag_task.setTag_id(tagID);
        tag_task.setTask_id(taskID);
        
        session.setAttribute("EditedTasktag", taskID);

        try {
            tagDao.deleteTag(tag_task);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        response.sendRedirect("EditTag.jsp");
        
        
        processRequest(request, response);
    }
    
    
}