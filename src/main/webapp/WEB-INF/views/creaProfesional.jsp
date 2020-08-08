<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Agregar Profesional</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
		integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>

<body>

	<div class="container">
		<c:set var="p" value="${model.p}"></c:set>
		<c:set var="u" value="${model.u}"></c:set>
		<h1 class="display-4">Agregar Profesional</h1>
		<hr>
		<c:if test="${message != 'f'}">
			<c:out value = "${message}"/>
		</c:if>

		<form:form action="${pageContext.request.contextPath}/guardarProfesional" method="post" >

			<div class="row">
				<div class="col-3">Nombre:</div>
				<div class="col-7">
					<input class="form-control" type="text" name="nombre" required />
				</div>
			</div>
			<hr>

			<div class="row">
				<div class="col-3" class="control-label">
					<label>Apellido:</label>
				</div>
				<div class="col-7">
					<input class="form-control" type="text" name="apellido" required />
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-3">Correo:</div>
				<div class="col-7">
					<input class="form-control" type="email" name="correo" placeholder="Recuerde Formato Correo @"
						required />

				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-3">Telefono:</div>
				<div class="col-7">
					<input class="form-control" type="number" name="telefono" required />
				</div>
			</div>
			<hr>
			<div class="form-row">
				<div class="col-3">Cargo:</div>
				<div class="col-7">
					<input class="form-control" type="text" name="cargo" required />
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-3">Nickname:</div>
				<div class="col-7">
					<input id="nickname1" class="form-control" type="text" name="nickname" required />
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-3">Rol:</div>
				<div class="col-7">
					<select name="rol" class="form-control">
						<option value="ROLE_ADMINISTRADOR">Administrador</option>
						<option value="ROLE_CLIENTE">Cliente</option>
						<option value="ROLE_PROFESIONAL" selected>Profesional</option>
					</select>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-3">Password:</div>
				<div class="col-7">
					<input class="form-control" type="password" name="password" required />
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-1 ">
					<a class="btn btn-secondary" href="${pageContext.request.contextPath}/listarProfesional">Listado</a>
				</div>
				<div class="col-1">
					<input class="btn btn-success" type="submit" value="Guardar">
				</div>
			</div>
		</form:form>
	</div>
</body>

</html>