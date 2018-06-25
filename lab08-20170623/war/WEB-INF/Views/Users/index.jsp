<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="controller.users.UsersControllerIndex"%>
<%@ page import="model.entity.User"%>
<%@ page import="model.entity.Role"%>
<%
	List<User> users = (List<User>)request.getAttribute("users");
	List<Role> roles = (List<Role>)request.getAttribute("roles");
	String almacenaRol="";
%>
<!DOCTYPE html>
<html lang="es">
<head>
	<link rel="stylesheet" type="text/css" href="/css/estilosIndex.css">
	<link rel="stylesheet" type="text/css" href="/css/fonts.css">
	<link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
	<meta charset="utf-8">
	<title>Lista de Usuarios</title>
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
	<p>Lista de Usuarios</p>
		<% if (users.isEmpty()){ %>
		<p>No se encuentran usuarios. Añada Usuarios</p>
		<%} else { %>
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>Nombre</th>
					<th>Rol</th>
					<th>Ciudad</th>
					<th>Edad</th>
					<th>Celular</th>
					<th>Correo electrónico</th>
					<th>Género</th>
					<th>Estado</th>
					<th>Creado</th>
				</tr>
			</thead>
			<% for (User us: users){%>
			<tr>
				<td><a id="cambiaColor" href="/users/view?id=<%=us.getId()%>"><%=us.getId()%></a></td>
				<td><%=us.getNombre()%></td>
				<%if(roles.isEmpty()){ %>
					<td>Asigne un Rol</td>
				<%}else{%>
					<% for (Role r: roles){%>
						<%if(r.getId().equals(us.getIdRol())){
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
				<td><%=us.getCiudad()%></td>
				<td><%=us.getEdad() %>
				<td><%=us.getCelular()%></td>
				<td><%=us.getCorreo()%></td>
				<td>
					<%if(us.isGender()){ %>
						Masculino
					<%} else{ %>
						Femenino
					<%} %>
				</td>
				<td><%=us.isStatus() %></td>
				<td><%=us.getMade() %></td>
			</tr>
			<%} %>
		</table>
		<%} %>
		<div class="link">
			<a id="add"href="/users/add" title="Añadir Usuario"><img alt="Añadir usuario" src="img/add.png" id="img"></a>
		</div>
	</div>
</body>
</html>