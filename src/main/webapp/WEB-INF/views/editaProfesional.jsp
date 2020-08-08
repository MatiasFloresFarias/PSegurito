<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Editar Profesional</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
		integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>

<body>
	<div class="container">
		<c:set var="p" value="${model.p}"></c:set>
<%-- 		<c:set var="u" value="${model.u}"></c:set> --%>
		<h1 class="display-4">Editar Profesional</h1>
		<br>
		<form:form action="${pageContext.request.contextPath}/guardarEditProfesional" method="post">
			<input type="hidden" name="id_profesional" value="${p.getId_profesional()}">
			<div class="row">
				<div class="col-3">Nombre:</div>
				<div class="col-7">
					<input class="form-control" type="text" name="nombre" value="${p.getNombre()}" required />
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-3">Apellido:</div>
				<div class="col-7">
					<input class="form-control" type="text" name="apellido" value="${p.getApellido()}" required />
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-3">Correo:</div>
				<div class="col-7">
					<input class="form-control" type="text" name="correo" value="${p.getCorreo()}" required />
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-3">Telefono:</div>
				<div class="col-7">
					<input class="form-control" type="number" name="telefono" value="${p.getTelefono()}" required />
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-3">Cargo:</div>
				<div class="col-7">
					<input class="form-control" type="text" name="cargo" value="${p.getCargo()}"  required/>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-3">Nickname:</div>
				<div class="col-7">
					<input id="nickname1" class="form-control" type="text" name="usuario.nickname" readonly
						value="${p.getUsuario().getNickname()}" required />
				</div>
			</div>
			<hr>
			<input class="form-control" type="hidden" name="usuario.id_usuario" value="${p.getUsuario().getId_usuario()}" />
<!-- 			<div class="row"> -->
<!-- 				<div class="col-3">Password:</div> -->
<!-- 				<div class="col-7"> -->
<%-- 					<input class="form-control" type="password" name="password" value="${u.getPassword()}" /> --%>
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<hr> -->
<%-- 			<input class="form-control" type="hidden" name="id_usuario" value="${u.getId_usuario()}" /> --%>
<!-- 			<div class="row"> -->
<!-- 				<div class="col-3">Rol:</div> -->
<!-- 				<div class="col-7"> -->
<!-- 					<select name="rol" class="form-control"> -->
<%-- 						<option value="ROLE_ADMINISTRADOR" ${u.getRol()=='administrador' ? 'selected' : '' }>Administrador --%>
<!-- 						</option> -->
<%-- 						<option value="ROLE_CLIENTE" ${u.getRol()=='cliente' ? 'selected' : '' }>Cliente</option> --%>
<%-- 						<option value="ROLE_PROFESIONAL" ${u.getRol()=='profesional' ? 'selected' : '' }>Profesional</option> --%>
<!-- 					</select> -->

<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<hr> -->
			<div class="row">
				<div class="col-1"><a class="btn btn-secondary"
						href="${pageContext.request.contextPath}/listarProfesional">Volver</a></div>
				<div class="col-1"><input class="btn btn-success" type="submit" value="Guardar"></div>

			</div>
		</form:form>
	</div>
</body>

</html>