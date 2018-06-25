<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@page import="model.entity.Role"%>
<%
	List<Role> roles = (List<Role>)request.getAttribute("roles");
%>
<!DOCTYPE html>
<html lang="es">
<head>
<link href="https://fonts.googleapis.com/css?family=Oswald"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Añadir usuario</title>
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
			<form action="/users/add"  name = "formulario" method="post">
				<h1>Añadir Usuario</h1>
				
				<p>Ingrese su nombre </p>
				<input type="text" id="nombre" name="nombre" placeholder="Ingrese su nombre">
				
				<p>Ingrese su ciudad</p>
				<input type="text" id="ciudad" name="ciudad" placeholder="Ingrese su ciudad">
				
				<p>Ingrese su edad </p>
				<input type="number" id="edad" name="edad" placeholder="Ingrese su edad">
				
				<p>Ingrese su número de celular </p>
				<input type="text" id="celular" name="celular" placeholder="Ingrese su número de celular">
				
				<p>Ingrese su correo </p>
				<input type="email" id="correo" name="correo" placeholder="Ingrese su correo electrónico">
				
				<p>Seleccione su genero </p>
				<div class="radio">
					<input type="radio" name="gender" id="hombre" value="true" checked> <label for="hombre">Masculino</label>
					<input type="radio" name="gender" id="mujer" value="false"> <label for="mujer">Femenino</label>
				</div>
				
				<p>Seleccione su rol </p>
				<select name="roles">
				<% for (Role r: roles){ %>
					<option value="<%=r.getId()%>"><%=r.getNombre() %></option>
				<%} %>
				</select>
				<input type="submit" id="submiit" value="Crear Usuario">
				
				
			</form>
			<script>
				(function(){
					
					var formulario = document.getElementsByName('formulario')[0],
						elementos = formulario.elements,
						boton = document.getElementById('submit');
					
					var validarNombre = function(e){
						if(formulario.nombre.value == ""){
							alert("Llene el campo nombre");
							e.preventDefault();
						}
						else if(isNaN(formulario.nombre.value)===false){
							alert("El campo NOMBRE solo debe contener letras");
							e.preventDefault();
						}
					}
					var validarCiudad = function(e){
						if(formulario.ciudad.value == ""){
							alert("Llene el campo ciudad");
							e.preventDefault();
						}
						else if(isNaN(formulario.ciudad.value)===false){
							alert("El campo CIUDAD solo debe contener letras");
							e.preventDefault();
						}
					}
					var validarEdad = function(e){
						if(formulario.edad.value == ""){
							alert("Llene el campo edad");
							e.preventDefault();
						}
						else if(formulario.edad.value <= 18 && formulario.edad.value >=65 ){
							alert("Usted debe tener entre 18 y 65 años para registrarse");
							e.preventDefault();
						}
					}
					var validarCelular = function(e){
						if(formulario.celular.value == ""){
							alert("Llene el campo celular");
							e.preventDefault();
						}
						else if(isNaN(formulario.celular.value)){
							alert("Compelete el campo CELULAR solo con números");
							e.preventDefault();
						}
						else if(formulario.celular.value.length < 9 || formulario.celular.value.length > 9){
							alert("El campo celular debe contener un número de 9 digitos");
							e.preventDefault();
						}
					}
					var validarCorreo = function(e){
						if(formulario.correo.value == ""){
							alert("Llene el campo correo");
							e.preventDefault();
						}
					}
					var validar = function(e){
						validarNombre(e);
						validarCiudad(e);
						validarEdad(e);
						validarCelular(e);
						validarCorreo(e);
					}
					
					formulario.addEventListener("submit",validar);
					
					
				}())	
			</script>
		</div>
		<a href="/users"><img src="/img/logo.png"></a>
	</div>
</body>
</html>