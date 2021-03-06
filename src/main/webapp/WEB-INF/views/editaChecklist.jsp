<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checklist</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="https://trentrichardson.com/examples/timepicker/jquery-ui-timepicker-addon.css">
</head>
<body>
<div class="container">
	<c:set var="ch" value="${model.ch}"></c:set>
	<c:set var="v" value="${model.listav}"></c:set>
	<h1 class="btn btn-success" class="display-4">Editar Checklist</h1>
	<br>
	
	
	<form:form action="${pageContext.request.contextPath}/guardarEditChecklist" method="post">
			<input type="hidden" name="id_checklist" value="${model.ch.getId_checklist()}" required>
			<div class="row">
				<div class="col-3">Version:</div>
				<div class="col-7">
					<input class="form-control" type="text" name="version"
						value="${model.ch.getVersion()}" required />
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-3">Visita:</div>
				<div class="col-7">
						<select name="visita.id_visita" class="form-control form-control">
							<c:forEach items="${model.listav}" var="visita">
								<option value="${visita.getId_visita()}"
									${model.f.getVisita().getId_visita()==visita.getId_visita() ? 'selected' : '' }>
									fecha visita: ${visita.getFechavisita()} numero visita: ${visita.getNumerovisita()} profesional:${visita.getProfesional().getNombre()} ${visita.getProfesional().getApellido()} cliente:${visita.getCliente().getNombreEmpresa()}   </option>
							</c:forEach>
						</select>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-1"><a class="btn btn-secondary" href="${pageContext.request.contextPath}/listarChekclist">Volver</a></div>
				<div class="col-1"><input class="btn btn-success" type="submit" value="Guardar"></div>
				
			</div>
		</form:form>
</div>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</body>
</html>