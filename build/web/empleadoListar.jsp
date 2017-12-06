<%-- 
 *      Author ::: Brian Sterling
 *     Program ::: Bases de Datos
 *  Credential ::: SIST0008-G01:SIV
--%>
<%@page import="modelo.Empleado"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
        <title>Empleado</title>
    </head>
    <body>
        <table border=1>
            <thead>
                <tr>
                    <th>Empleado Id</th>
                    <th>Nombre</th>
                    <th>Salario</th>
                    <th>Trabajo Id</th>
                    <th colspan=2>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Empleado> users = (List<Empleado>) request.getAttribute("empleado");
                    if (users != null)
                    {
                        for (Empleado user : users)
                        {
                %>
                <tr>
                    <td><%=user.getIdEmpleado()%></td>
                    <td><%=user.getNombre()%></td>
                    <td><%=user.getSalario()%></td>
                    <td><%=user.getIdTrabajo()%></td>
                    <td><a href="EmpleadoControlador?action=edit&idEmpleado=<%=user.getIdEmpleado()%>">Actualizar</a></td>
                    <td><a href="EmpleadoControlador?action=delete&idEmpleado=<%=user.getIdEmpleado()%>">Borrar</a></td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
        <p>
            <a href="EmpleadoControlador?action=insert">Agregar</a>
        </p>
    </body>
</html>