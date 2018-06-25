<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.entity.Access"%>
<%@page import="java.util.Date"%>
<%@ page import="java.util.List"%>
<%@page import="model.entity.Role"%>
<%@page import="model.entity.Resource"%>
<%
	List<Role> roles = (List<Role>)request.getAttribute("roles");
	List<Resource> resources = (List<Resource>)request.getAttribute("resources");
%>
<%
	Access access = (Access) request.getAttribute("access");
%>
<!DOCTYPE html>
<html lang="es">
<head>
	<link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
	<meta charset="utf-8">
	<title>Editar Access</title>
	<link rel="stylesheet" type="text/css" href="/css/estilosEdit.css">
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
			<form action="/access/edit" method="post" name="formulario">
				<h1>Editar Access</h1>
				
				<p>Edite su rol</p>
				<select name="roles">
				<% for (Role r: roles){ %>		
					<option value="<%=r.getId()%>"><%=r.getNombre() %></option>
				<%} %>
				</select>
				
				<p>Edite su resource</p>
				<select name="resources">
				<% for (Resource re: resources){ %>		
					<option value="<%=re.getId()%>"><%=re.getUrl() %></option>
				<%} %>
				</select>
				
				<p>Edite su estado</p>
				<select name="status">	
					<option value="true">true</option>
					<option value="false">false</option>
				</select>
				<input type="hidden" name="id" value="<%=access.getId()%>">
				<input type="submit" value="Editar Información">
			</form>
		</div>
		<a href="/access"><img src="/img/logo.png"></a>
	</div>
</body>
</html>