<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="controller.access.AccessControllerIndex"%>
<%@ page import="model.entity.Access"%>
<%@ page import="model.entity.Resource"%>
<%@ page import="model.entity.Role"%>

<%
	List<Access> access = (List<Access>)request.getAttribute("access");

	List<Role> roles = (List<Role>)request.getAttribute("roles");
	List<Resource> resources = (List<Resource>)request.getAttribute("resources");
	
	String almacenaRol="";
	String almacenaResource="";
%>
<!DOCTYPE html>
<html lang="es">
<head>
	<link rel="stylesheet" type="text/css" href="/css/estilosIndex.css">
	<link rel="stylesheet" type="text/css" href="/css/fonts.css">
	<link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
	<meta charset="utf-8">
	<title>Lista de Access</title>
</head>
<body>
	<header>
		<nav>
			<ul>
				<li><a href="/users"><span class="primero"><i class="icon icon-users"></i></span>Users</a></li>
            	<li><a href="/roles"><span class="segundo"><i class="icon icon-roles"></i></span>Roles</a></li>
            	<li><a href="/resources"><span class="tercero"><i class="icon icon-resources"></i></span>Resources</a></li>
            	<li><a href="/access"><span class="cuarto"><i class="icon icon-access"></i></span>Access</a></li>
            	<li><a href="/users/login"><span class="quinto"><i class="icon icon-login"></i></span>Login</a></li>
            	<li><a href="/users/logout"><span class="sexto"><i class="icon icon-logout"></i></span>Logout</a></li>
			</ul>
		</nav>
	</header>
	<div class="contenedor-form">
	<p>Lista de Access</p>
		<% if (access.isEmpty()){ %>
		<p>No se encuentran access. Añada nuevos</p>
		<%} else { %>
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>Rol</th>
					<th>Resource</th>
					<th>Status</th>
					<th>Creado</th>
				</tr>
			</thead>
			<% for (Access a: access){%>
			<tr>
				<td><a id="cambiaColor" href="/access/view?id=<%=a.getId()%>"><%=a.getId()%></a></td>
				
				<!--  ROLES -->
				<%if(roles.isEmpty()){ %>
					<td>Asigne un Rol</td>
				<%}else{%>
					<% for (Role r: roles){%>
						<%if(r.getId().equals(a.getIdRol())){
							almacenaRol=r.getNombre();%>
						<%} %>
					<%} %>	
					<% if(almacenaRol.equals("")) {%>
						<td>Asigne un Rol2 </td>
					<%} else { %>
						<td><%= almacenaRol %></td>
						<%= almacenaRol="" %>
					<%} %>		
				<%} %>
				
				<!--  RESOURCES -->
				<%if(resources.isEmpty()){ %>
					<td>Asigne un Resource</td>
				<%}else{%>
					<% for (Resource re: resources){%>
						<%if(re.getId().equals(a.getIdResource())){
							almacenaResource=re.getUrl();%>
						<%} %>
					<%} %>	
					<% if(almacenaResource.equals("")) {%>
						<td>Asigne un Resource2 </td>
					<%} else { %>
						<td><%= almacenaResource %></td>
						<%= almacenaResource="" %>
					<%} %>		
				<%} %>
				<td><%=a.isStatus() %></td>
				<td><%=a.getMade() %></td>
			</tr>
			<%} %>
		</table>
		<%} %>
		<div class="link">
			<a id="add"href="/access/add" title="Añadir Access"><img alt="Añadir access" src="img/add.png" id="img"></a>
		</div>
	</div>
</body>
</html>