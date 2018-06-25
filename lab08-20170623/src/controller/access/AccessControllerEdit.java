package controller.access;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
public class AccessControllerEdit extends HttpServlet {
	
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
	 				/* Buscando acceso registrado activo para el Rol y Recurso */
	 				String query3 = "select from "+ Access.class.getName() + " where idRol ==" + uSearch.get(0).getIdRol()+
	 						"&& idResource=="+rSearch.get(0).getId()+ " && status==true";
	 				List<Access> aSearch =(List<Access>) pm.newQuery(query3).execute();
	 				/* Verificando acceso registrado */
	 				if(aSearch.isEmpty()){
	 					RequestDispatcher dp = getServletContext().getRequestDispatcher("/WEB-INF/Views/Errors/deny4.jsp");
	 	 	 			dp.forward(req, resp);
	 				}else{
	 					PersistenceManager pm2 = PMF.get().getPersistenceManager();
	 					Access access = pm2.getObjectById(Access.class, Long.parseLong(req.getParameter("id")));
	 					
	 					req.setAttribute("access", access);
	 					
	 					String queryEntra = "SELECT FROM "+ Role.class.getName();
	 					List<Role> roles = (List<Role>)pm2.newQuery(queryEntra).execute();
	 					req.setAttribute("roles", roles);
	 					
	 					queryEntra = "SELECT FROM "+ Resource.class.getName();
	 					List<Resource> resources = (List<Resource>)pm2.newQuery(queryEntra).execute();
	 					req.setAttribute("resources", resources);
	 					
	 					
	 					RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/Views/Access/edit.jsp");
	 					rd.forward(req, resp);
	 				}
	 				
	 			}
	 			
	 		}
	 	}
	}
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		Access access = pm.getObjectById(Access.class, Long.parseLong(req.getParameter("id")));
		access.setIdRol(Long.parseLong(req.getParameter("roles")));
		access.setIdResource(Long.parseLong(req.getParameter("resources")));
		access.setStatus(Boolean.parseBoolean(req.getParameter("status")));
		pm.close();
		resp.sendRedirect("/access/view?id="+req.getParameter("id"));
	}
}
