<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="controller.roles.RolesControllerIndex"%>
<%@ page import="model.entity.Role"%>
<%List<Role> roles = (List<Role>)request.getAttribute("roles");%>
<!DOCTYPE html>
<html lang="es">
<head>
	<link rel="stylesheet" type="text/css" href="/css/estilosIndex.css">
	<link rel="stylesheet" type="text/css" href="/css/fonts.css">
	<link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
	<meta charset="utf-8">
	<title>Lista de Roles</title>
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
	<p>Lista de Roles</p>
		<% if (roles.isEmpty()){ %>
		<p>No se encuentran roles. Añada nuevos</p>
		<%} else { %>
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>Nombre</th>
					<th>Estado</th>
					<th>Creado</th>
				</tr>
			</thead>
			<% for (Role r: roles){%>
			<tr>
				<td><a id="cambiaColor" href="/roles/view?id=<%=r.getId()%>"><%=r.getId()%></a></td>
				<td><%=r.getNombre()%></td>
				<td><%=r.isStatus() %></td>
				<td><%=r.getMade() %></td>
			</tr>
			<%} %>
		</table>
		<%} %>
		<div class="link">
			<a id="add"href="/roles/add" title="Añadir Rol"><img alt="Añadir usuario" src="img/add.png" id="img"></a>
		</div>
	</div>
</body>
</html>