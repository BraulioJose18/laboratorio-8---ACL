package controller.users;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import controller.PMF;
import model.entity.User;
import model.entity.Role;

public class UsersControllerView extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		User user = pm.getObjectById(User.class, Long.parseLong(req.getParameter("id")));
		
		String query = "SELECT FROM "+ Role.class.getName();
		List<Role> roles = (List<Role>)pm.newQuery(query).execute();
		req.setAttribute("roles", roles);
		
		pm.close();
		req.setAttribute("user", user);		
		
		RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/Views/Users/view.jsp");
		rd.forward(req, resp);
	}
}