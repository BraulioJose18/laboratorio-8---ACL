package controller.users;

import java.io.IOException;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.users.UserServiceFactory;

import controller.PMF;
import model.entity.Role;
import model.entity.User;

@SuppressWarnings("serial")
public class UsersControllerAdd extends HttpServlet {
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		com.google.appengine.api.users.User uGoogle = UserServiceFactory.getUserService().getCurrentUser();
	 	
		 /*Verifica login */
		 if(uGoogle == null){
			 RequestDispatcher dp = getServletContext().getRequestDispatcher("/WEB-INF/Views/Errors/iniciar.jsp");
			 dp.forward(req, resp);
	 	}else {
	 		PersistenceManager pm = PMF.get().getPersistenceManager();
			String query = "SELECT FROM "+ Role.class.getName();
			List<Role> roles = (List<Role>)pm.newQuery(query).execute();
			req.setAttribute("roles", roles);
			
			RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/Views/Users/add.jsp");
			rd.forward(req, resp);
	 	} 		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		String nombre = request.getParameter("nombre");
		String query = "SELECT FROM "+User.class.getName();
		List<User>usuarios = (List<User>)pm.newQuery(query).execute();
		int a=0;
		for(User u: usuarios){
			if(u.getNombre().equals(nombre)){
				a++;
			}
		}
		if(a==0){
			User user = new User(nombre, request.getParameter("ciudad"),Integer.parseInt(request.getParameter("edad")),request.getParameter("celular"),request.getParameter("correo"),Boolean.parseBoolean(request.getParameter("gender")),Long.parseLong(request.getParameter("roles")));
			try{
				pm.makePersistent(user);
				pm.close();
				response.sendRedirect("/users");
			}catch(Exception e){
				System.out.println(e);
			}
		}else{	
			response.sendRedirect("/users/add");

		}
	}
}

