<%-- 
 *      Author ::: Brian Sterling
 *     Program ::: Bases de Datos
 *  Credential ::: SIST0008-G01:SIV
--%>
<%@page import="modelo.Empleado"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
        <title>Empleado</title>
    </head>
    <body>
        <%
            Empleado user = (Empleado) request.getAttribute("user");
            
            if (request.getParameter("action").equals("insert"))
            {
        %>
        <form method="POST" action='UserController' name="frmAddUser">
            Empleado ID : <input type="text" readonly="readonly" name="userid"/>
            <br /> 
            Nombre : <input type="text" name="firstName"/>
            <br />
            Salario : <input type="text" name="lastName"/>
            <br /> 
            Trabajo ID : <input  type="date" name="dob"/>
            <input type="submit" value="Submit" />
        </form>
        <%
            }
            else
            {
        %>
        <form method="POST" action='UserController' name="frmAddUser">
            Consultor ID : <input type="text" readonly="readonly" name="userid" value="<%=user.getIdEmpleado()%>" />
            <br /> 
            Nombre : <input type="text" name="firstName" value="<%=user.getNombre()%>" />
            <br />
            Salario : <input type="text" name="lastName" value="<%=user.getSalario()%>" />
            <br />
            Trabajo ID : <input type="text" name="dob" value="<%=user.getIdTrabajo()%>" />
            <br />
            <input type="submit" value="Submit" />
        </form>
        <%
            }
        %>
    </body>
</html>