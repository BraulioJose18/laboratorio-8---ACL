<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@page import="model.entity.Access"%>
<%@page import="model.entity.Role" %>
<%@page import="model.entity.Resource" %>
<%
	Access access = (Access) request.getAttribute("access");
	List<Role> roles = (List<Role>)request.getAttribute("roles");
	List<Resource> resources = (List<Resource>)request.getAttribute("resources");
	String almacenaRol="";
	String almacenaResource="";
%>
<!DOCTYPE html>
<html lang="es">
<head>
	<link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
	<meta charset="utf-8">
	<title><%=access.getId() %></title>
	<link rel="stylesheet" href="/css/vista.css">
	<link rel="stylesheet" type="text/css" href="/css/fonts.css">
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
	<div class="contenido">
		<h2 id="id" name="<%=access.getId() %>">Datos del Access </h2>
		<table class="vertical-table">
			<tr>
				<th>ID del access</th>
				<td><%=access.getId()%></td>
			</tr>
			<tr>
				<th>Nombre del Rol</th>
				<%if(roles.isEmpty()){ %>
					<td>Asigne un rol</td>
				<%}else{%>
					<% for (Role r: roles){%>
						<%if(r.getId().equals(access.getIdRol())){
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
			</tr>
			<tr>
				<th>Nombre del Resource</th>
				<%if(resources.isEmpty()){ %>
					<td>Asigne un resource</td>
				<%}else{%>
					<% for (Resource re: resources){%>
						<%if(re.getId().equals(access.getIdResource())){
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
			</tr>
			<tr>
				<th>Fecha de Creación</th>
				<td><%=access.getMade()%></td>
			</tr>
			<tr>
				<th>Estado</th>
				<td><%=access.isStatus()%></td>
			</tr>
		</table>
		<div class ="links">
			<table>
				<tr>
					<th><a href="/access"><img src="/img/logo.png"></a></th>
					<td><a href="/access/edit?id=<%=access.getId() %>"><img src="/img/edit.png"></a></td>
					<th>
						<div class="borrar">
							<form action="/access/delete" method="post">
							<input type="hidden" value="<%=access.getId()%>" name="id"> 
							<input type="image" src="/img/elimina.png" heigth="50px">
						</form>
						</div>
					</th>
				</tr>
				</table>
			</div>
		</div>
	</body>
</html>