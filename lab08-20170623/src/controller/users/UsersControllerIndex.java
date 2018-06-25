package controller.users;

import java.io.IOException;


import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import controller.PMF;
import model.entity.Role;
import model.entity.User;

public class UsersControllerIndex extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		String query = "SELECT FROM "+ User.class.getName();
		List<User> users = (List<User>)pm.newQuery(query).execute();
		query = "SELECT FROM "+ Role.class.getName();
		List<Role> roles = (List<Role>)pm.newQuery(query).execute();
		req.setAttribute("roles", roles);
		pm.close();
		req.setAttribute("users", users);
		RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/Views/Users/index.jsp");
		rd.forward(req, resp);
	}
}
