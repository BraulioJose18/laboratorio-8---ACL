package controller.resources;

import java.io.IOException;


import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.users.UserServiceFactory;

import controller.PMF;
import model.entity.Access;
import model.entity.Resource;

@SuppressWarnings("serial")
public class ResourcesControllerAdd extends HttpServlet {
	
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
			 			RequestDispatcher rd = this.getServletContext().getRequestDispatcher("/WEB-INF/Views/Resources/add.jsp");
			 			rd.forward(req, resp);
	 				}
	 				
	 			}
	 			
	 		}
	 	}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		String url = request.getParameter("url");
		String query = "SELECT FROM "+Resource.class.getName();
		List<Resource> resources = (List<Resource>)pm.newQuery(query).execute();
		int a=0;
		for(Resource r: resources){
			if(r.getUrl().equals(url)){
				a++;
			}
		}
		if(a==0){
			Resource resource = new Resource(url);
			try{
				pm.makePersistent(resource);
				pm.close();
				response.sendRedirect("/resources");
			}catch(Exception e){
				System.out.println(e);
			}
		}else{	
			response.sendRedirect("/resources/add");
		}
		
	}
}

