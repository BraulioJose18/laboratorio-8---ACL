<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ page import="java.util.List"%>
<%@page import="model.entity.Resource"%>
<%
	Resource resources = (Resource) request.getAttribute("resources");
%>
<!DOCTYPE html>
<html lang="es">
<head>
	<link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
	<meta charset="utf-8">
	<title>Editar Resource</title>
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
			<form action="/resources/edit" method="post" name="formulario">
				<h1>Editar Resource</h1>
				
				<p>Edite el nombre del resource</p>
				<input type="text" name="nombre"  placeholder="Ingrese su nombre" value="<%=resources.getUrl()%>" required>
				 
				<p>Edite su estado</p>
				<select name="status">	
					<option value="true">true</option>
					<option value="false">false</option>
				</select>
				<input type="hidden" name="id" value="<%=resources.getId()%>">
				<input type="submit" value="Editar Información">
			</form>
			<script>
				(function(){
					
					var formulario = document.getElementsByName('formulario')[0],
						elementos = formulario.elements,
						boton = document.getElementById('submit');
					
					var validarNombre = function(e){
						if(formulario.nombre.value == ""){
							alert("Llene el campo NOMBRE DEL RESOURCE");
							e.preventDefault();
						}
						else if(isNaN(formulario.nombre.value)===false){
							alert("El campo NOMBRE DEL RESOURCE solo debe contener letras");
							e.preventDefault();
						}
					}
					var validar = function(e){
						validarNombre(e);
					}
					
					formulario.addEventListener("submit",validar);
					
					
				}())	
			</script>
		</div>
		<a href="/resources"><img src="/img/logo.png"></a>
	</div>
</body>
</html>