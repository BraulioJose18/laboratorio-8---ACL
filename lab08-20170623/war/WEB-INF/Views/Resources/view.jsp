<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.entity.Resource"%>
<%
	Resource resources = (Resource) request.getAttribute("resources");
%>
<!DOCTYPE html>
<html lang="es">
<head>
	<link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
	<meta charset="utf-8">
	<title><%=resources.getUrl() %></title>
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
		<h2 id="id" name="<%=resources.getId() %>">Datos del Resource </h2>
		<table class="vertical-table">
			<tr>
				<th>ID del resource</th>
				<td><%=resources.getId()%></td>
			</tr>
			<tr>
				<th>Nombre del Resource</th>
				<td><%=resources.getUrl()%></td>
			</tr>
			<tr>
				<th>Fecha de Creación</th>
				<td><%=resources.getMade()%></td>
			</tr>
			<tr>
				<th>Estado</th>
				<td><%=resources.isStatus()%></td>
			</tr>
		</table>
		<div class ="links">
			<table>
				<tr>
					<th><a href="/resources"><img src="/img/logo.png"></a></th>
					<td><a href="/resources/edit?id=<%=resources.getId() %>"><img src="/img/edit.png"></a></td>
					<th>
						<div class="borrar">
							<form action="/resources/delete" method="post">
							<input type="hidden" value="<%=resources.getId()%>" name="id"> 
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