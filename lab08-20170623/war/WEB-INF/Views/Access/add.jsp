<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@page import="model.entity.Role"%>
<%@page import="model.entity.Resource"%>
<%
	List<Role> roles = (List<Role>)request.getAttribute("roles");
	List<Resource> resources = (List<Resource>)request.getAttribute("resources");
%>
<!DOCTYPE html>
<html lang="es">
<head>
<link href="https://fonts.googleapis.com/css?family=Oswald"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Añadir Access</title>
<link rel="stylesheet" type="text/css" href="/css/estilosAdd.css">
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
	<div class="contenedor-form">
		<div class="formulario">
			<form action="/access/add"  name = "formulario" method="post">
				<h1>Añadir Nuevo Access</h1>
				
				<p>Seleccione su rol </p>
				<select name="roles">
				<% for (Role r: roles){ %>		
					<option value="<%=r.getId()%>"><%=r.getNombre() %></option>
				<%} %>
				</select>
				
				<p>Seleccione su resource </p>
				<select name="resources">
				<% for (Resource r: resources){ %>		
					<option value="<%=r.getId()%>"><%=r.getUrl() %></option>
				<%} %>
				</select>

				<input type="submit" id="submit" value="Crear Access">
				
			</form>
		</div>
		<a href="/access"><img src="/img/logo.png"></a>
	</div>
</body>
</html>