/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BewareServlet;

import BewareBean.Login;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;

import BewareDatabase.LoginDao;

/**
 *
 * @author feral
 */

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private LoginDao loginDao;

    public void init() {
        loginDao = new LoginDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String name = request.getParameter("name");
        String password = request.getParameter("password");
        Login login = new Login();
        login.setName(name);
        login.setPassword(password);

        try {
            int UID = loginDao.validate(login);
            if (UID != -1) {
                HttpSession session = request.getSession();
                session.setAttribute("username", name);
                session.setAttribute("userID", UID);
                response.sendRedirect("Task.jsp");
            } else {
                HttpSession session = request.getSession();
                //session.setAttribute("user", username);
               
                 response.sendRedirect("Login.jsp");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
