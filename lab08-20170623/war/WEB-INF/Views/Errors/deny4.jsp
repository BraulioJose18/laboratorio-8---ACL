<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<link rel="stylesheet" type="text/css" href="/css/estilosIndex.css">
	<link rel="stylesheet" type="text/css" href="/css/fonts.css">
	<link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
	<meta charset="utf-8">
	<title>Denegado 2</title>
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
	
		<h1>Acceso denegado</h1>
		<p> Usted no tiene los permisos suficientes para realizar esta acción </p>
		<!--  <p> Esta el recurso pero no el acceso</p> -->
		
	</div>
</body>
</html>