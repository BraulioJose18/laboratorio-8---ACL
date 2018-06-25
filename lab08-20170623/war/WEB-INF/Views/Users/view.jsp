<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@page import="model.entity.User"%>
<%@page import="model.entity.Role" %>
<%
	User user = (User) request.getAttribute("user");
	List<Role> roles = (List<Role>)request.getAttribute("roles");
	String almacenaRol="";
%>
<!DOCTYPE html>
<html lang="es">
<head>
	<link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
	<meta charset="utf-8">
	<title><%=user.getNombre() %></title>
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
		<h2 id="id" name="<%=user.getId() %>">Perfil de Usuario: </h2>
		<table class="vertical-table">
			<tr>
				<th>ID de usuario</th>
				<td><%=user.getId()%></td>
			</tr>
			<tr>
				<th>Nombre</th>
				<td><%=user.getNombre()%></td>
			</tr>
			<tr>
				<th>Ciudad</th>
				<td><%=user.getCiudad()%></td>
			</tr>
			<tr>
				<th>Edad</th>
				<td><%=user.getEdad()%></td>
			</tr>
			<tr>
				<th>Celular</th>
				<td><%=user.getCelular()%></td>
			</tr>
			<tr>
				<th>Correo Electrónico</th>
				<td><%=user.getCorreo()%></td>
			</tr>
			<tr>
				<th>Género</th>
				<td>
					<%if(user.isGender()){ %>
					Masculino
					<%} else{ %>
					Femenino
					<%} %>
				</td>
			</tr>
			<tr>
				<th>Rol</th>
				<%if(roles.isEmpty()){ %>
					<td>Asigne un rol</td>
				<%}else{%>
					<% for (Role r: roles){%>
						<%if(r.getId().equals(user.getIdRol())){
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
				<th>Creado</th>
				<td><%=user.getMade()%></td>
			</tr>
			<tr>
				<th>Estado</th>
				<td><%=user.isStatus()%></td>
			</tr>
		</table>
		<div class ="links">
			<table>
				<tr>
					<th><a href="/users"><img src="/img/logo.png"></a></th>
					<td><a href="/users/edit?id=<%=user.getId() %>"><img src="/img/edit.png"></a></td>
					<th>
						<div class="borrar">
							<form action="/users/delete" method="post">
							<input type="hidden" value="<%=user.getId()%>" name="id"> 
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