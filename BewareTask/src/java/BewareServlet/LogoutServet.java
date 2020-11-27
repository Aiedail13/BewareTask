package BewareServlet;

import BewareBean.Login;
import BewareDatabase.LoginDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Mystery-PC
 */
@WebServlet("/logout")
public class LogoutServet extends HttpServlet {
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
        
        try{
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.removeAttribute("username");
                response.sendRedirect("Login.jsp");
            }
        } catch(Exception e){
            e.printStackTrace();
        }
    }
}
