package controller.access;

import java.io.IOException;

import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.users.UserServiceFactory;

import controller.PMF;
import model.entity.Access;
import model.entity.Role;
import model.entity.Resource;

@SuppressWarnings("serial")
public class AccessControllerIndex extends HttpServlet {
	
	@SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		com.google.appengine.api.users.User uGoogle = UserServiceFactory.getUserService().getCurrentUser();
	 	
		 /*Verifica login */
		 if(uGoogle == null){
			 RequestDispatcher dp = getServletContext().getRequestDispatcher("/WEB-INF/Views/Errors/iniciar.jsp");
			 dp.forward(req, resp);
	 	}else {
	 		/* PMF de consultas */
	 		PersistenceManager pm = PMF.get().getPersistenceManager();
	 		/* Buscando usuario registrado activo con el email*/
	 		String query = "select from " + model.entity.User.class.getName() + " where correo=='"+uGoogle.getEmail()+"'"+" && status==true";
	 		List<model.entity.User> uSearch = (List<model.entity.User>) pm.newQuery(query).execute();
	 		/* Verificando usuario registrado */
	 		if(uSearch.isEmpty()){
	 			RequestDispatcher dp = getServletContext().getRequestDispatcher("/WEB-INF/Views/Errors/loginSinRegistro.jsp");
	 			dp.forward(req, resp);
	 		}else{
	 			System.out.println(req.getServletPath());
	 			/* Buscando resource registrado activo de acuerdo a la URL */
	 			String query2 = "select from "+model.entity.Resource.class.getName() + " where url=='"+req.getServletPath()+"'"+" && status==true";
	 			List<model.entity.Resource> rSearch = (List<model.entity.Resource>) pm.newQuery(query2).execute();
	 			/*verificando recurso de registrado */
	 			if(rSearch.isEmpty()){
	 				RequestDispatcher dp = getServletContext().getRequestDispatcher("/WEB-INF/Views/Errors/deny3.jsp");
	 	 			dp.forward(req, resp);
	 			}else {
	 				PersistenceManager pm2 = PMF.get().getPersistenceManager();
	 				
	 				String queryEntra = "SELECT FROM "+ Access.class.getName();
	 				List<Access> access = (List<Access>)pm2.newQuery(queryEntra).execute();
	 				
	 				queryEntra = "SELECT FROM "+ Role.class.getName();
	 				List<Role> roles = (List<Role>)pm2.newQuery(queryEntra).execute();
	 				
	 				
	 				queryEntra = "SELECT FROM "+ Resource.class.getName();
	 				List<Resource> resources = (List<Resource>)pm2.newQuery(queryEntra).execute();
	 				
	 				req.setAttribute("roles", roles);
	 				req.setAttribute("resources", resources);
	 				
	 				pm.close();
	 				req.setAttribute("access", access);
	 				RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/Views/Access/index.jsp");
	 				rd.forward(req, resp);
	 			}
	 		}
	 	}
	}
}
